Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:33570 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1757936AbcKAPSi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Nov 2016 11:18:38 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/3] mmc: tmio-mmc: add support for 32bit data port
Date: Tue, 1 Nov 2016 15:13:32 +0000
Message-ID: <SG2PR06MB116573EF21F52BC479F0C7C08AA10@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20160912141507.6837-1-chris.brandt@renesas.com>
 <20160912141507.6837-3-chris.brandt@renesas.com>
 <20161101084938.GA1576@katana>
 <SG2PR06MB11652157C1DA12165852747C8AA10@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <20161101150759.GA1436@katana>
In-Reply-To: <20161101150759.GA1436@katana>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> > I don't understand "TMIO_MMC_BIG_DATA_PORT" (How do you know 32-bit??
> How do you know 64-bit??)
>=20
> I think 16 << host->bus_shift should work; need to verify this, though.


Good idea.
