#!/usr/bin/env python3

import json
from packaging import version

def find_release(json_dict):
	releases = filter(
		lambda x: x["prerelease"] is False,
		json_dict,
	)
	releases = list(releases)
	if not len(releases):
		return None
	return sorted(releases, key=lambda x: version.parse(x["tag_name"]))[-1]

def find_release_tarball(release_version):
	upstream_url = "https://dl.grafana.com/oss/release/grafana-"
	release_arch = "linux-amd64"
	tarball_url = upstream_url + str(release_version) + "." + release_arch + ".tar.gz"
	return tarball_url

async def generate(hub, **pkginfo):
	json_dict = await hub.pkgtools.fetch.get_page(
		"https://api.github.com/repos/grafana/grafana/releases", is_json=True)
	release = find_release(json_dict)
	if release is None:
		raise hub.pkgtools.ebuild.BreezyError("Can't find a suitable release of Grafana.")
	version = release["tag_name"][1:]
	src_artifact = hub.pkgtools.ebuild.Artifact(url=find_release_tarball(version))
	ebuild = hub.pkgtools.ebuild.BreezyBuild(
		**pkginfo,
		version=version,
		artifacts=[src_artifact]
	)
	ebuild.push()

# vim: ts=4 sw=4 noet
