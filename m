Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:53830 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752556AbdAZC6O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 21:58:14 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "laurent.pinchart@ideasonboard.com"
        <laurent.pinchart@ideasonboard.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [RFC 1/5] pinctrl: rz-pfc: Add Renesas RZ pinctrl core module
Date: Thu, 26 Jan 2017 02:58:08 +0000
Message-ID: <SG2PR06MB1165F5A3E97EF8381288EDC18A770@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-2-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1485367787-8109-2-git-send-email-jacopo+renesas@jmondi.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Wednesday, January 25, 2017, Jacopo Mondi wrote:
>  drivers/pinctrl/Kconfig             |   1 +
>  drivers/pinctrl/Makefile            |   1 +
>  drivers/pinctrl/rz-pfc/Kconfig      |  18 ++
>  drivers/pinctrl/rz-pfc/Makefile     |   1 +
>  drivers/pinctrl/rz-pfc/pinctrl-rz.c | 447
> ++++++++++++++++++++++++++++++++++++
>  drivers/pinctrl/rz-pfc/pinctrl-rz.h | 114 +++++++++
>  6 files changed, 582 insertions(+)
>  create mode 100644 drivers/pinctrl/rz-pfc/Kconfig  create mode 100644
> drivers/pinctrl/rz-pfc/Makefile  create mode 100644 drivers/pinctrl/rz-
> pfc/pinctrl-rz.c
>  create mode 100644 drivers/pinctrl/rz-pfc/pinctrl-rz.h



I think we should try to avoid the rz naming as much as possible since
this driver will hopefully be useful for other future Renesas devices if
they move to a similar pin-control type method. Maybe future "R-car" SoCs?
Or, maybe Renesas Marketing decides to come up with a new name for SoCs.

Otherwise, you could end up with a directly like "mach-shmobile" filled
with a bunch of...well...not SH-Mobile parts.

Maybe just
  drivers/pinctrl/renesas/pinctrl-renesas.c



Chris
