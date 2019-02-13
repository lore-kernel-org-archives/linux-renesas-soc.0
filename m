Return-Path: <SRS0=YTPq=QU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D66C282C2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 10:27:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC34421905
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 10:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388076AbfBMK13 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Feb 2019 05:27:29 -0500
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:10018 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732488AbfBMK13 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Feb 2019 05:27:29 -0500
X-IronPort-AV: E=Sophos;i="5.58,365,1544511600"; 
   d="scan'208";a="26478277"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES128-SHA; 13 Feb 2019 03:27:19 -0700
Received: from localhost (10.10.76.4) by CHN-SV-EXCH01.mchp-main.com
 (10.10.76.37) with Microsoft SMTP Server id 14.3.352.0; Wed, 13 Feb 2019
 03:27:19 -0700
Date:   Wed, 13 Feb 2019 11:27:10 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <linux-i2c@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] i2c: document the SDA hold time binding
Message-ID: <20190213102710.xzlzilttoigkufna@M43218.corp.atmel.com>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        jarkko.nikula@linux.intel.com
References: <20190211132515.24163-1-wsa+renesas@sang-engineering.com>
 <20190213102437.dtemwn4amsosqba7@M43218.corp.atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190213102437.dtemwn4amsosqba7@M43218.corp.atmel.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Sorry I didn't keep the addition of Jarkko to the CC list.

On Wed, Feb 13, 2019 at 11:24:37AM +0100, Ludovic Desroches wrote:
> Hi Wolfram,
> 
> On Mon, Feb 11, 2019 at 02:25:15PM +0100, Wolfram Sang wrote:
> > The documentation was forgotten when the feature was added.
> > 
> > Fixes: 4717be73c284 ("i2c: core: Parse SDA hold time from firmware")
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> > 
> > To everyone on CC: I want to confirm here that you use the value really for
> > t(hd:sta) and not t(hd:dat). I'd be a little confused otherwise...
> 
> 
> No in our case, it's t(hd:dat):
> TWD is kept unchanged after TWCK falling edge for a
> period of (HOLD + 3) × t peripheral clock
> 
> 
> Ludovic
> 
> > 
> >  Documentation/devicetree/bindings/i2c/i2c.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> > index 44efafdfd7f5..b7bc4c4cc2e6 100644
> > --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> > +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> > @@ -55,6 +55,10 @@ wants to support one of the below features, it should adapt the bindings below.
> >  	Number of nanoseconds the SDA signal takes to fall; t(f) in the I2C
> >  	specification.
> >  
> > +- i2c-sda-hold-time-ns
> > +	Number of nanoseconds the SDA signal needs to be held; t(hd:sta) in
> > +	the I2C specification.
> > +
> >  - interrupts
> >  	interrupts used by the device.
> >  
> > -- 
> > 2.11.0
> > 
