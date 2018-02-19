Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:37691 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751877AbeBSIVT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Feb 2018 03:21:19 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
CC: "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "geert@linux-m68k.org" <geert@linux-m68k.org>
Subject: RE: [PATCH] serial: sh-sci: prevent lockup on full TTY buffers
Date: Mon, 19 Feb 2018 08:21:16 +0000
Message-ID: <TY1PR06MB0992CAE8225296D9057DE742D8C80@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1518696147-23790-1-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1518696147-23790-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

> From: Ulrich Hecht, Sent: Thursday, February 15, 2018 9:02 PM
>=20
> When the TTY buffers fill up to the configured maximum, a system lockup
> occurs:
>=20
> [  598.820128] INFO: rcu_preempt detected stalls on CPUs/tasks:
> [  598.825796]  0-...!: (1 GPs behind) idle=3D5a6/2/0 softirq=3D1974/1974=
 fqs=3D1
> [  598.832577]  (detected by 3, t=3D62517 jiffies, g=3D296, c=3D295, q=3D=
126)
> [  598.838755] Task dump for CPU 0:
> [  598.841977] swapper/0       R  running task        0     0      0 0x00=
000022
> [  598.849023] Call trace:
> [  598.851476]  __switch_to+0x98/0xb0
> [  598.854870]            (null)
>=20
> This can be prevented by doing a dummy read of the RX data register.
>=20
> This issue affects both HSCIF and SCIF ports. Reported for R-Car H3 ES2.0=
;
> reproduced and fixed on H3 ES1.1. Probably affects other R-Car platforms
> as well.
>=20
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---

Thank you for the patch. Our team tested this patch and the issue disappear=
ed.
So,

Tested-by: Nguyen Viet Dung <dung.nguyen.aj@renesas.com>

Best regards,
Yoshihiro Shimoda
