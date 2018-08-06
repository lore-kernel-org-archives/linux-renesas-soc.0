Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:35408 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729374AbeHFQ1n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 12:27:43 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulrich Hecht <uli@fpond.eu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH/RFC 4/4] sh-sci: Derive regshift value from DT compatible
 value
Date: Mon, 6 Aug 2018 14:18:17 +0000
Message-ID: <TY1PR01MB15621F645BA5AA48C6060F0D8A200@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180806140755.24087-1-geert+renesas@glider.be>
 <20180806140755.24087-5-geert+renesas@glider.be>
In-Reply-To: <20180806140755.24087-5-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Monday, August 06, 2018 1, linux-sh-owner@vger.kernel.org wrote:
> Deriving the proper regshift value from the register block size is
> fragile (it may have been rounded up in DT, and the mapping granularity
> is usually PAGE_SIZE anyway), and turned out to be inappropriate for
> earlycon support (the size is not easily available).
>=20
> On DT systems, derive it from the compatible value instead.
> This requires adding an entry for RZ/A2 serial ports, which use an
> atypical regshift value.

I had a simple patch to add support for CONFIG_DEBUG_LL for RZ/A2=20
because earlycon never worked because of RZ/A2's different register locatio=
ns.

I'll have to see how things change (better?) with this patch.


Chris
