Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:56045 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752082AbdGMPvJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jul 2017 11:51:09 -0400
From: Chris Paterson <Chris.Paterson2@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: sh-pfc: r8a7791: Add missing mmc_data8_b pin
 group
Date: Thu, 13 Jul 2017 15:50:56 +0000
Message-ID: <TY1PR06MB0702C7C16CE4766948CDC37DB7AC0@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <1499860713-27650-1-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1499860713-27650-1-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Geert,

> From: linux-gpio-owner@vger.kernel.org [mailto:linux-gpio-
> owner@vger.kernel.org] On Behalf Of Geert Uytterhoeven
> Sent: 12 July 2017 12:59
>=20
> Pins D6 and D7 of the MMC interface can be muxed to two different sets of
> pins, but currently only one set is supported.
> Add a pin group for the alternative set to fix this.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

I've also tested this on the iwg20m board which uses these pins. All looks =
okay.
Tested-by: Chris Paterson <chris.paterson2@renesas.com>

Kind regards, Chris
