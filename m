Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F4D489894;
	Thu, 30 Jul 2026 17:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431609; cv=none; b=MTByovTj7oahsCOO/9Qh7zJDFUX9shWlwUr9qBbwGBufalur/45mjHZzDGBZsmWVDw7fVl9xCkMR197+eWuTo/bHJRg47VtSDqAJ28bj8bXFR3XMMNFvYYmiAv7z9mEIefTOqKo4oBl99FMBSL26/0kqOcLG2T4vhLeTVYKOdMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431609; c=relaxed/simple;
	bh=i6E1dPzMX7WUEyHHPxEjdKYb9CQCqCsmtnbxYohXB44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rqnuo5bQ4JEt9NtK/KFPjok0lfg+L/D8+29yUrWNwF+pJQhGCnJUSp+mJLZF8sXsUVphT78AvLEMwXgTEAJs0c7PhKdEkFS8LE6CXdkUYqkWsxRNMyQf7WL39NSB+ykJxbcWtM2rgGyqk8j1/zTltsevSBwLa5vRXYyvo0sU4UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=CmreSo6D; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D3d4PYDu; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="CmreSo6D";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D3d4PYDu"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id E2CDBEC019F;
	Thu, 30 Jul 2026 13:13:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 30 Jul 2026 13:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1785431605; x=1785518005; bh=P+
	tgBzgRtE08SDzNvnFSzQmhr8NmXiiIqAoPwRF5wAg=; b=CmreSo6DgHqLfYX5uW
	ql53V4P95Vp/OiwYTHh26pjChHMZyqNAlxljdbpItOcMkw1Jo99VMAceagJOCqs+
	uD9SQyUfYooY+BvI1ibfH5omZIY8kC6vAxhR0UdQrcIjQGP5seGi/SpfHgs/2bpy
	fFZt/B91celAlHHIF8N1aQCj92dmDbC+hFTvXE5p+pO4Hq1bXTGIPALq06JnA3jf
	E4H58PF5m6Bnnr8a0ThcH4KihNyqQ25PbH0eiP06JR4zB+QtxjyIQrCcyjVxEIt9
	42QcKqllppK2VfEr7LGJovQefIvlqbQyD1vJt6CyiTGln8O4spqpCkThP2TQJg1s
	i76A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1785431605; x=1785518005; bh=P+tgBzgRtE08SDzNvnFSzQmhr8Nm
	XiiIqAoPwRF5wAg=; b=D3d4PYDusj1ITZ/2L5GFidb6NA2gvT+VtHo0eFBIa+A8
	2kYuA3hZkpkK/ZQe5Eg6vI3e0utZiuxZgPUGjyi1OsVf9gJe0Bk4F4h8tLi5P+Ml
	C2nslSr7lo8X4Xih/xNDDyfEkeGHF+M51YJtikoxZSMDjD+1bsf6qDEfBvrTQ2d6
	1oyoxQOcN7Q/aZfFVdN+lAZSRnHDupD1GsFNF805ONpfpJNqnV4UGGkuqxxVXBor
	lpqyg7CzCowFgYOkGRP54ZyykC5FpzLBec3NyuD9qIEjTbCf/3DbT7SWmEN0BzNe
	P1SROIqkDK9XN0zM5YdHR9O3sUYvVeW234//eiA9mg==
X-ME-Sender: <xms:NYZravAJoE4VDQuUdbUS68uBLiPwZICDNrps5aZPAvvGrjos1GEYYQ>
    <xme:NYZrai5EEiBnXidV5XnhiwwjiKWdfIsXlZlg2quEhQ95vILUy6g4Eo4fs6_Gi7eYA
    tvU5O-UxzaZSwPjEjiP9WB2sgRjonFbL1m30_WkmIwkvQnNXt-h1x0>
X-ME-Received: <xmr:NYZrakFs4pG4oRl1ofIZnhBFbilzyOvjjAsm3iyFFhLt1qLkdJF0iL6FvkMQjJmcL3papO7mhdnX9boQDlqIHeCx3aXcSPI>
X-ME-Proxy-Cause: dmFkZTFXUijUg7MInW8p0gNJvOdMRItwy1C3zTt5f8I0GTvZXw743yfLk0QFW0bgXpgBaF
    tRPaPlxmHR8KQISP2HmZnNwPw6ahqb9KBFpgLXIoBFTksQJngiP97kD2kFRmAb4ABK9v7S
    uIseEymSx/tT0yIZZjGwBui+Su4w1KZ9tZ/fv9+lbtQYn0SJA/swjU1QfnqLmyspKJ8OQ5
    LjyqHNALLW+I70J86JYRkfGMTojv6g3HyOqQ2cPW5tJUlknUv0zZB0u8CURTSrX1xhbXMf
    RxWzHI+utLpHLujXV6krWgldPW/NWZ5H3Y/hKFHkgAlET+FG4yrO0ee7DLRtXlncr2ahYS
    Cfz6auz1VZDbP60gm01vI28a7cGn8vYB1H7xmxii/IAW1xBoCuqGdpAJXR0/9JlZqxJBpA
    cJDB1ipibv7dLKbuCypmbeHg9KGI+G70bBolBKT1WgtsDzOpHwZPaJodxJGzaQfY94Lduo
    NISXRVRHWMw6QtrQgxdJ8QBgonGiBQlj9tlL37Om0Cxh/uK2CAoqurZXzT+HbQrl4T2lO4
    mdpsnyl7gWtg2fwNNZwz/a9U+atJaSL+QJmj0f/8OHyThIZI60yTm19OTmGZLIjNQuHRpS
    pXoc4p9zX+AaxdCF78qPvy/MUi+HVAF+8qNFiz18+x8/RxfADbMD0STminLg
X-ME-Proxy: <xmx:NYZratA_ET5Tt7DehUZzWWHSfaTh8KVe9y0SJwOvWq_aJrSzFxqF5w>
    <xmx:NYZrapyR5YLklwgyLhKIYn0fhHLVpFSb18yBSn5Utur1ysoichbcpw>
    <xmx:NYZrah5rr3dVG1L4woNf2mQrIGcfFtp58L3fy93fanfrnDmm8N2Kcw>
    <xmx:NYZraqxiekpbTTHFYtdRJ-m7t-fqvHkZdyXj9vykbxuh6kgBfWyNBg>
    <xmx:NYZralG28-58FASlMDIWZnoYin2Z_geTcDtYx_qx1H_-0vCpxllDbZ7W>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 13:13:25 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v11 00/13] media: Add support for R-Car ISP using Dreamchip RPPX1 ISP
Date: Thu, 30 Jul 2026 19:12:28 +0200
Message-ID: <20260730171241.483870-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This series adds support for two different devices that together enable
ISP support on Renesas R-Car Gen4 ISP processing. The first driver added
is for Dreamchip RPPX1 ISP, this device purely deals with image
processing algorithms, statistics and image conversion; but have no DMA
engines. The second driver is for the R-Car ISP CORE, this device
deals with DMA to/from the RPPX1 ISP and provides a V4L2 user-space
interface for the ISP.

The R-Car ISP driver uses the RPPX1 framework to drive the ISP and
together the two devices provide a functional ISP. For detailed
description of the RPPX1 see patch 3/13, and for details about the R-Car
ISP see commit message in patch 4/13.

All functional blocks present on the RPPX1 are not yet added to the
driver, but most are.

Patch 1/13 adds two new pixel formats, one for parameters and one for
statistics. While patch 2/13 adds the scaffolding for the uAPI, each
module will add the structures needed to this file in a backward
compatible way.

Patch 3/13 adds the foundation for the RPPX1 framework. It deals with
probing all function blocks making sure every blocks version register is
supported and setup a "passthru" pipeline that just debayer RAW images.

Patch 4/13 integrates the adds the R-Car ISP CORE DMA parts and
integrates with the RPPX1 framework added in patch 3/13.

Patches 5/13 to 13/13 extends the RPPX1 framework with the logic to drive
the different IPS modules.

The sum of the work pass v4l2-compliance. A test suite for the enabled
function blocks exists and pass. I have also used Jacopo's and Jai's
libcamera pipeline for the R-Car together with the updated header file to
verify libcamera operation.

This series depends on the ISP extensible statistics definitions
out-of-tree patches [1].

See individual patches for change log.

1. https://lore.kernel.org/all/20260627-extensible-stats-v3-0-3b600bb2db8b@ideasonboard.com/

Jai Luthra (3):
  media: Add RPPX1_PARAMS and RPPX1_STATS meta formats
  media: uapi: Add extensible param and stats blocks for RPPX1
  media: rppx1: lin: Add support for gamma sensor linearization

Niklas Söderlund (10):
  media: rppx1: Add framework to support Dreamchip RPPX1 ISP
  media: rcar-isp: Add support for ISPCORE
  media: rppx1: wbmeas: Add support for white balance measurement
  media: rppx1: awbg: Add support for white balance gain settings
  media: rppx1: exm: Add support for exposure measurement
  media: rppx1: hist: Add support histogram measurement
  media: rppx1: bls: Add support for black level compensation
  media: rppx1: ccor: Add support for color correction matrix
  media: rppx1: lsc: Add support for lens shade correction
  media: rppx1: ga: Add support for gamma out correction

 .../userspace-api/media/v4l/meta-formats.rst  |   1 +
 .../userspace-api/media/v4l/metafmt-rppx1.rst |  99 ++
 MAINTAINERS                                   |  10 +
 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/Makefile               |   1 +
 drivers/media/platform/dreamchip/Kconfig      |   3 +
 drivers/media/platform/dreamchip/Makefile     |   6 +
 .../media/platform/dreamchip/rppx1/Kconfig    |  12 +
 .../media/platform/dreamchip/rppx1/Makefile   |  33 +
 .../platform/dreamchip/rppx1/rpp_module.c     |  39 +
 .../platform/dreamchip/rppx1/rpp_module.h     | 119 +++
 .../platform/dreamchip/rppx1/rpp_params.c     | 115 ++
 .../platform/dreamchip/rppx1/rpp_stats.c      |  66 ++
 .../media/platform/dreamchip/rppx1/rppx1.c    | 381 +++++++
 .../media/platform/dreamchip/rppx1/rppx1.h    | 105 ++
 .../platform/dreamchip/rppx1/rppx1_acq.c      | 148 +++
 .../platform/dreamchip/rppx1/rppx1_awbg.c     |  63 ++
 .../media/platform/dreamchip/rppx1/rppx1_bd.c |  53 +
 .../platform/dreamchip/rppx1/rppx1_bdrgb.c    |  81 ++
 .../platform/dreamchip/rppx1/rppx1_bls.c      | 157 +++
 .../platform/dreamchip/rppx1/rppx1_cac.c      |  30 +
 .../platform/dreamchip/rppx1/rppx1_ccor.c     | 166 +++
 .../media/platform/dreamchip/rppx1/rppx1_db.c |  45 +
 .../platform/dreamchip/rppx1/rppx1_dpcc.c     |  77 ++
 .../platform/dreamchip/rppx1/rppx1_exm.c      | 127 +++
 .../media/platform/dreamchip/rppx1/rppx1_ga.c |  91 ++
 .../platform/dreamchip/rppx1/rppx1_hist.c     | 186 ++++
 .../platform/dreamchip/rppx1/rppx1_hist256.c  |  47 +
 .../media/platform/dreamchip/rppx1/rppx1_is.c |  43 +
 .../platform/dreamchip/rppx1/rppx1_lin.c      | 112 ++
 .../platform/dreamchip/rppx1/rppx1_lsc.c      | 188 ++++
 .../platform/dreamchip/rppx1/rppx1_ltm.c      |  49 +
 .../platform/dreamchip/rppx1/rppx1_ltmmeas.c  |  42 +
 .../platform/dreamchip/rppx1/rppx1_outif.c    |  46 +
 .../platform/dreamchip/rppx1/rppx1_outregs.c  |  76 ++
 .../platform/dreamchip/rppx1/rppx1_rmap.c     |  63 ++
 .../platform/dreamchip/rppx1/rppx1_rmapmeas.c |  47 +
 .../platform/dreamchip/rppx1/rppx1_shrp.c     |  65 ++
 .../platform/dreamchip/rppx1/rppx1_wbmeas.c   | 165 +++
 .../platform/dreamchip/rppx1/rppx1_xyz2luv.c  |  27 +
 .../media/platform/renesas/rcar-isp/Kconfig   |   2 +
 .../media/platform/renesas/rcar-isp/Makefile  |   2 +-
 .../media/platform/renesas/rcar-isp/core-io.c | 997 ++++++++++++++++++
 .../media/platform/renesas/rcar-isp/core.c    | 901 ++++++++++++++++
 .../media/platform/renesas/rcar-isp/csisp.c   |  48 +-
 .../platform/renesas/rcar-isp/risp-core.h     | 178 ++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
 include/media/rppx1.h                         |  36 +
 .../uapi/linux/media/dreamchip/rppx1-config.h | 730 +++++++++++++
 include/uapi/linux/videodev2.h                |   4 +
 50 files changed, 6077 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-rppx1.rst
 create mode 100644 drivers/media/platform/dreamchip/Kconfig
 create mode 100644 drivers/media/platform/dreamchip/Makefile
 create mode 100644 drivers/media/platform/dreamchip/rppx1/Kconfig
 create mode 100644 drivers/media/platform/dreamchip/rppx1/Makefile
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_module.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_module.h
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_params.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rpp_stats.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1.h
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_acq.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bd.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bdrgb.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_bls.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_cac.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_db.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_dpcc.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ga.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_hist256.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_is.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ltm.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_ltmmeas.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_outif.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_outregs.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_rmap.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_rmapmeas.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_shrp.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
 create mode 100644 drivers/media/platform/dreamchip/rppx1/rppx1_xyz2luv.c
 create mode 100644 drivers/media/platform/renesas/rcar-isp/core-io.c
 create mode 100644 drivers/media/platform/renesas/rcar-isp/core.c
 create mode 100644 drivers/media/platform/renesas/rcar-isp/risp-core.h
 create mode 100644 include/media/rppx1.h
 create mode 100644 include/uapi/linux/media/dreamchip/rppx1-config.h

-- 
2.55.0

