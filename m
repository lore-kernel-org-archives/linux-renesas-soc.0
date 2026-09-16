Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53B139A4C4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Sep 2026 23:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789603013; cv=none; b=bJaHNG9KMy749poKCZejUIAetcpnxN2OoMkAkwhRqiJKDvr5Vzg2m3FCWnjKANIn7LR6YY9lBsk39TGaDnr0PoPoxMofQdmDBcKDfoYtFpm6Y0EbGbzfeubOSHfyo0omO5qsJWiaIpMHIXtTVb9C/4uwz6LvBIkgu+7zk1E9TiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789603013; c=relaxed/simple;
	bh=HqAFO+rCo8pkUB9HBokIDz9VgcaDYaz/MkYDybnPvhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ku2rA2GjiV+4yb0RWcuZAeweCkcgzcwn+cuhVyszHgvo7TGW7iiiaS3hRBuVJwfy/OaKiAy0mjHje6i23LEZI8IxbmC5XoqVUaNvi1Bo558Xdp/ISxGGD5bAEkwdoGRWgSugfmlk/X+wU/hVZKF/zXeyAIYn2AZNUaW47dTmNw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ba0v5bDz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ba0v5bDz"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BED60512;
	Thu, 17 Sep 2026 01:55:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789602907;
	bh=HqAFO+rCo8pkUB9HBokIDz9VgcaDYaz/MkYDybnPvhQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ba0v5bDzPlX0rsYVDKN/B6wHUlG45r0UQ+NDUDd9tdoVB702aZpO3eO7HQjqVHoFF
	 bUPRHqh1ihSCril3kSbAAQrwllQbaVB7zDt4IyGg+neIAWN/u99GE7/71soPIwWNtO
	 52/HTF/5nEgKd4XkpLfnBJGVSFACAVCFk95ES//g=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>
Subject: [vsp-tests] [PATCH 0/4] Ease test suite packaging
Date: Thu, 17 Sep 2026 02:56:44 +0300
Message-ID: <20260916235648.261920-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

The VSP test suite is a set of shell scripts and binaries that have
grown organically over time. The usage pattern has so far always been to
copy the files to the target device in a custom directory and run the
tests from there. While this works fine for manual testing, it is not
ideal for packaging and integration in distributions.

This patch series solves this issue. The first patch is a small drive-by
code consistency cleanup. After that, patch 2/4 updates the build system
to install the test suite in FHS-compatible locations. Patch 3/4 then
fixes storage of log files when the test suite is installed in a system
location. Finally, patch 4/4 prints the location of unit tests in the
log to ease debugging.

I have tested this by installing the test suite in /usr/local/ and
$HOME/vsp/ and running it from those two locations.

Paul, this should facilitate integration in buildroot. Could you please
test and review the series ?

Laurent Pinchart (4):
  Use lowercase for all shell script variables
  Install in FHS-compatible locations
  vsp-lib: Store logs in current directory
  vsp-tests: Print location of unit tests

 data/frames/meson.build             |  6 +-
 meson.build                         |  4 ++
 scripts/bin2png.sh                  | 12 ++--
 scripts/logger.sh                   |  9 +--
 scripts/meson.build                 |  6 +-
 scripts/vsp-lib.sh                  | 98 +++++++++++++++--------------
 scripts/{vsp-tests.sh => vsp-tests} | 14 +++--
 src/meson.build                     |  4 +-
 tests/meson.build                   |  2 +-
 tests/vsp-unit-test-0001.sh         |  2 +-
 tests/vsp-unit-test-0002.sh         |  2 +-
 tests/vsp-unit-test-0003.sh         |  2 +-
 tests/vsp-unit-test-0004.sh         |  2 +-
 tests/vsp-unit-test-0005.sh         |  2 +-
 tests/vsp-unit-test-0006.sh         |  2 +-
 tests/vsp-unit-test-0007.sh         |  2 +-
 tests/vsp-unit-test-0008.sh         |  2 +-
 tests/vsp-unit-test-0009.sh         |  2 +-
 tests/vsp-unit-test-0010.sh         |  2 +-
 tests/vsp-unit-test-0011.sh         |  2 +-
 tests/vsp-unit-test-0012.sh         |  2 +-
 tests/vsp-unit-test-0013.sh         |  2 +-
 tests/vsp-unit-test-0014.sh         |  2 +-
 tests/vsp-unit-test-0015.sh         |  2 +-
 tests/vsp-unit-test-0016.sh         |  2 +-
 tests/vsp-unit-test-0017.sh         |  2 +-
 tests/vsp-unit-test-0018.sh         |  2 +-
 tests/vsp-unit-test-0019.sh         |  2 +-
 tests/vsp-unit-test-0020.sh         |  2 +-
 tests/vsp-unit-test-0021.sh         |  2 +-
 tests/vsp-unit-test-0022.sh         |  2 +-
 tests/vsp-unit-test-0023.sh         |  2 +-
 tests/vsp-unit-test-0024.sh         |  2 +-
 tests/vsp-unit-test-0025.sh         |  2 +-
 tests/vsp-unit-test-0026.sh         |  2 +-
 tests/vsp-unit-test-0027.sh         |  2 +-
 36 files changed, 113 insertions(+), 96 deletions(-)
 rename scripts/{vsp-tests.sh => vsp-tests} (77%)


base-commit: ec6f576c9544a66a2b62e17b52b4d36a131bc49e
-- 
Regards,

Laurent Pinchart

