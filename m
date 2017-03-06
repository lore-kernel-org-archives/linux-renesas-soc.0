Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60095 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752500AbdCFAqd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Mar 2017 19:46:33 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR renesas-drivers] VSP1 rotation and histogram
Date: Mon, 06 Mar 2017 02:47:08 +0200
Message-ID: <4407429.F5AJ3MCJrM@avalon>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

The following changes since commit 130f8756b9b83c0137ee0d587152a7ef3e10=
f74b:

  v4l: vsp1: Register pipe with output WPF (2017-03-05 01:53:46 +0200)

are available in the git repository at:

  git://linuxtv.org/pinchartl/media.git vsp1/histogram

for you to fetch changes up to 8bcdadfb22f218a42dc07b502c2a7ffc56509874=
:

  v4l: vsp1: Add HGT support (2017-03-06 02:39:38 +0200)

----------------------------------------------------------------
Laurent Pinchart (8):
      v4l: Clearly document interactions between formats, controls and =
buffers
      v4l: vsp1: wpf: Implement rotation support
      v4l: Add metadata buffer type and format
      v4l: vsp1: Add histogram support
      v4l: vsp1: Support histogram generators in pipeline configuration=

      v4l: vsp1: Fix HGO and HGT routing register addresses
      v4l: Define a pixel format for the R-Car VSP1 1-D histogram engin=
e
      v4l: vsp1: Add HGO support

Niklas S=F6derlund (2):
      v4l: Define a pixel format for the R-Car VSP1 2-D histogram engin=
e
      v4l: vsp1: Add HGT support

 Documentation/media/uapi/v4l/buffer.rst               | 111 +++++
 Documentation/media/uapi/v4l/dev-meta.rst             |  62 +++
 Documentation/media/uapi/v4l/devices.rst              |   1 +
 Documentation/media/uapi/v4l/meta-formats.rst         |  16 +
 Documentation/media/uapi/v4l/pixfmt-meta-vsp1-hgo.rst | 168 +++++++
 Documentation/media/uapi/v4l/pixfmt-meta-vsp1-hgt.rst | 120 +++++
 Documentation/media/uapi/v4l/pixfmt.rst               |   1 +
 Documentation/media/uapi/v4l/vidioc-querycap.rst      |   3 +
 Documentation/media/videodev2.h.rst.exceptions        |   2 +
 drivers/media/platform/Kconfig                        |   1 +
 drivers/media/platform/vsp1/Makefile                  |   1 +
 drivers/media/platform/vsp1/vsp1.h                    |   6 +
 drivers/media/platform/vsp1/vsp1_drm.c                |   2 +-
 drivers/media/platform/vsp1/vsp1_drv.c                |  70 ++-
 drivers/media/platform/vsp1/vsp1_entity.c             | 154 +++++-
 drivers/media/platform/vsp1/vsp1_entity.h             |   8 +-
 drivers/media/platform/vsp1/vsp1_hgo.c                | 228 +++++++++
 drivers/media/platform/vsp1/vsp1_hgo.h                |  45 ++
 drivers/media/platform/vsp1/vsp1_hgt.c                | 222 +++++++++
 drivers/media/platform/vsp1/vsp1_hgt.h                |  42 ++
 drivers/media/platform/vsp1/vsp1_histo.c              | 646 ++++++++++=
+++++++
 drivers/media/platform/vsp1/vsp1_histo.h              |  84 ++++
 drivers/media/platform/vsp1/vsp1_pipe.c               |  38 +-
 drivers/media/platform/vsp1/vsp1_pipe.h               |   4 +
 drivers/media/platform/vsp1/vsp1_regs.h               |  33 +-
 drivers/media/platform/vsp1/vsp1_rpf.c                |   2 +-
 drivers/media/platform/vsp1/vsp1_rwpf.c               |   5 +
 drivers/media/platform/vsp1/vsp1_rwpf.h               |   7 +-
 drivers/media/platform/vsp1/vsp1_video.c              |  42 +-
 drivers/media/platform/vsp1/vsp1_wpf.c                | 205 ++++++--
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c         |  19 +
 drivers/media/v4l2-core/v4l2-dev.c                    |  16 +-
 drivers/media/v4l2-core/v4l2-ioctl.c                  |  36 ++
 drivers/media/v4l2-core/videobuf2-v4l2.c              |   3 +
 include/media/v4l2-ioctl.h                            |  17 +
 include/trace/events/v4l2.h                           |   1 +
 include/uapi/linux/videodev2.h                        |  17 +
 37 files changed, 2336 insertions(+), 102 deletions(-)
 create mode 100644 Documentation/media/uapi/v4l/dev-meta.rst
 create mode 100644 Documentation/media/uapi/v4l/meta-formats.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-vsp1-hgo.r=
st
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-vsp1-hgt.r=
st
 create mode 100644 drivers/media/platform/vsp1/vsp1_hgo.c
 create mode 100644 drivers/media/platform/vsp1/vsp1_hgo.h
 create mode 100644 drivers/media/platform/vsp1/vsp1_hgt.c
 create mode 100644 drivers/media/platform/vsp1/vsp1_hgt.h
 create mode 100644 drivers/media/platform/vsp1/vsp1_histo.c
 create mode 100644 drivers/media/platform/vsp1/vsp1_histo.h

--=20
Regards,

Laurent Pinchart
