Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:12809 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751443AbcLFBf1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2016 20:35:27 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kishon@ti.com" <kishon@ti.com>, "sre@kernel.org" <sre@kernel.org>
CC: "Peter.Chen@nxp.com" <Peter.Chen@nxp.com>,
        "wens@csie.org" <wens@csie.org>,
        "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>,
        "b-liu@ti.com" <b-liu@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "chanwoo@kernel.org" <chanwoo@kernel.org>
Subject: RE: [PATCH 12/12] usb: renesas_usbhs: Replace the deprecated extcon
 API
Date: Tue, 6 Dec 2016 01:35:19 +0000
Message-ID: <HK2PR06MB054887D913505E133A021D68D8820@HK2PR06MB0548.apcprd06.prod.outlook.com>
References: <1480485460-2663-1-git-send-email-cw00.choi@samsung.com>
 <1480485460-2663-13-git-send-email-cw00.choi@samsung.com>
In-Reply-To: <1480485460-2663-13-git-send-email-cw00.choi@samsung.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> From: Chanwoo Choi
> Sent: Wednesday, November 30, 2016 2:58 PM
>=20
> This patch replaces the deprecated extcon API as following:
> - extcon_get_cable_state_() -> extcon_get_state()
>=20
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Thank you for the patch!

Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda
