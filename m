Return-Path: <devicetree-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] usb: renesas_usbhs: add support for R-Car D3
Date: Tue,  3 Oct 2017 20:09:12 +0900
Message-Id: <1507028954-15738-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest Felipe's usb.git / testing/next branch
(commit id = af846d7ab55c846af6d6f150e9af96295101e068)

Yoshihiro Shimoda (2):
  usb: renesas_usbhs: unify Gen2/3 pipe_config setting
  usb: renesas_usbhs: add support for R-Car D3

 .../devicetree/bindings/usb/renesas_usbhs.txt      |  1 +
 drivers/usb/renesas_usbhs/common.c                 | 21 ++++++----
 drivers/usb/renesas_usbhs/rcar3.c                  | 48 ++++++++++++++++++++++
 drivers/usb/renesas_usbhs/rcar3.h                  |  1 +
 include/linux/usb/renesas_usbhs.h                  |  5 ++-
 5 files changed, 65 insertions(+), 11 deletions(-)

-- 
1.9.1

