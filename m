Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:28257 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751312AbdARR1W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jan 2017 12:27:22 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH] mmc: host: tmio: disable clocks when unbinding
Date: Wed, 18 Jan 2017 17:20:33 +0000
Message-ID: <SG2PR06MB11655E5CF25211A3AE7329FC8A7F0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170117202601.3742-1-wsa@the-dreams.de>
In-Reply-To: <20170117202601.3742-1-wsa@the-dreams.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Tuesday, January 17, 2017, Wolfram Sang wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Create a helper function to disable clocks and use it in remove(), too.
> Now, clk_summary in debugfs reports the clocks as disabled and unprepared
> after unbinding.

Just tried it, now sh_mobile_sdhi_clk_disable() is called when unbinding.

Thanks,
Chris
