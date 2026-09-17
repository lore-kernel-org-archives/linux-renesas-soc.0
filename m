Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B55D49A3AE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Sep 2026 10:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640604; cv=none; b=qBXe/aBeMuU3h5977Gqlc9p3aIn5jNu6Y4vTyQO1vcxHA6afWWZDSy8MmW26n3f1hDJ1CVnlMx1NQMHGLtbwMOATCeiwKkBFCKunRixxBwNL1oJ+v2MALf5tT4tEQ//SE8nMOBBoBgRYEyayDUtnTBcCOYBWc3u/0+zCDv98K7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640604; c=relaxed/simple;
	bh=IQkmbn6OBGcmELEN+K5uace/cxf6o/+LwLTMx2feC8c=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=oIvLHfyU+jAkXiSoNRiUskrIVHtcKD2YbvmDip6IsMGWXDqMG0DbSPPuvkdTKSXLlJPH1oFcfGF0kb0ZWm1tOxQMaasOzlvjF/MdjdC9Opc0Nbbcys41D98hLRruh8qHCwpNxJ88kd3d/Nnlr9GB69hsoGobyQ0KoGGODCm0cGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hD09aKZH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hD09aKZH"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:a4f1:7e05:2192:a835])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 64D9A2C6;
	Thu, 17 Sep 2026 12:21:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789640493;
	bh=IQkmbn6OBGcmELEN+K5uace/cxf6o/+LwLTMx2feC8c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hD09aKZHNOOUCTTg6cqkcWIrPYWv46aQTKM8j8xxDTud0x052Tm9iv182IaMbmShY
	 dGxgI0oHDhUjTDVRKaSaAQLSFNFiXUKf68XpSFULP1u0iRKOX3Y2OQ2pK9EXrrIt/H
	 NB1RfJY2DhQ9HbO9eSCMfSTfPDU1h9kHuVQtnDC4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260916235648.261920-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260916235648.261920-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [vsp-tests] [PATCH 0/4] Ease test suite packaging
From: Paul Elder <paul.elder@ideasonboard.com>
Cc:
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Date: Thu, 17 Sep 2026 19:23:10 +0900
Message-ID: <178964059044.52643.3890979713408079709@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Laurent Pinchart (2026-09-17 08:56:44)
> Hello,
>=20
> The VSP test suite is a set of shell scripts and binaries that have
> grown organically over time. The usage pattern has so far always been to
> copy the files to the target device in a custom directory and run the
> tests from there. While this works fine for manual testing, it is not
> ideal for packaging and integration in distributions.
>=20
> This patch series solves this issue. The first patch is a small drive-by
> code consistency cleanup. After that, patch 2/4 updates the build system
> to install the test suite in FHS-compatible locations. Patch 3/4 then
> fixes storage of log files when the test suite is installed in a system
> location. Finally, patch 4/4 prints the location of unit tests in the
> log to ease debugging.
>=20
> I have tested this by installing the test suite in /usr/local/ and
> $HOME/vsp/ and running it from those two locations.
>=20
> Paul, this should facilitate integration in buildroot. Could you please
> test and review the series ?

Tested-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

>=20
> Laurent Pinchart (4):
>   Use lowercase for all shell script variables
>   Install in FHS-compatible locations
>   vsp-lib: Store logs in current directory
>   vsp-tests: Print location of unit tests
>=20
>  data/frames/meson.build             |  6 +-
>  meson.build                         |  4 ++
>  scripts/bin2png.sh                  | 12 ++--
>  scripts/logger.sh                   |  9 +--
>  scripts/meson.build                 |  6 +-
>  scripts/vsp-lib.sh                  | 98 +++++++++++++++--------------
>  scripts/{vsp-tests.sh =3D> vsp-tests} | 14 +++--
>  src/meson.build                     |  4 +-
>  tests/meson.build                   |  2 +-
>  tests/vsp-unit-test-0001.sh         |  2 +-
>  tests/vsp-unit-test-0002.sh         |  2 +-
>  tests/vsp-unit-test-0003.sh         |  2 +-
>  tests/vsp-unit-test-0004.sh         |  2 +-
>  tests/vsp-unit-test-0005.sh         |  2 +-
>  tests/vsp-unit-test-0006.sh         |  2 +-
>  tests/vsp-unit-test-0007.sh         |  2 +-
>  tests/vsp-unit-test-0008.sh         |  2 +-
>  tests/vsp-unit-test-0009.sh         |  2 +-
>  tests/vsp-unit-test-0010.sh         |  2 +-
>  tests/vsp-unit-test-0011.sh         |  2 +-
>  tests/vsp-unit-test-0012.sh         |  2 +-
>  tests/vsp-unit-test-0013.sh         |  2 +-
>  tests/vsp-unit-test-0014.sh         |  2 +-
>  tests/vsp-unit-test-0015.sh         |  2 +-
>  tests/vsp-unit-test-0016.sh         |  2 +-
>  tests/vsp-unit-test-0017.sh         |  2 +-
>  tests/vsp-unit-test-0018.sh         |  2 +-
>  tests/vsp-unit-test-0019.sh         |  2 +-
>  tests/vsp-unit-test-0020.sh         |  2 +-
>  tests/vsp-unit-test-0021.sh         |  2 +-
>  tests/vsp-unit-test-0022.sh         |  2 +-
>  tests/vsp-unit-test-0023.sh         |  2 +-
>  tests/vsp-unit-test-0024.sh         |  2 +-
>  tests/vsp-unit-test-0025.sh         |  2 +-
>  tests/vsp-unit-test-0026.sh         |  2 +-
>  tests/vsp-unit-test-0027.sh         |  2 +-
>  36 files changed, 113 insertions(+), 96 deletions(-)
>  rename scripts/{vsp-tests.sh =3D> vsp-tests} (77%)
>=20
>=20
> base-commit: ec6f576c9544a66a2b62e17b52b4d36a131bc49e
> --=20
> Regards,
>=20
> Laurent Pinchart
>
