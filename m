Return-Path: <SRS0=0QnK=RS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F094EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 11:58:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8AF52184C
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Mar 2019 11:58:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="W4z175N8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727540AbfCOL6A (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Mar 2019 07:58:00 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:35715 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbfCOL6A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Mar 2019 07:58:00 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7446825BED4;
        Fri, 15 Mar 2019 22:57:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552651077; bh=U49GrtalKAD04bh1fac4Rh+mQMPa6u/vNW46WkcfHhs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W4z175N8F5kH3b16lN7FFex49Msy9fXV4nys87cUmAyx+5sd7aUP36vcrIoy6jL9q
         l0xoVN3NfWYBU/syW+SfSg46Mh3fNupWxSimHStZH720YTEiYAlcTJgtrXW4dkacOy
         HP7U6kmrFjmdcuFDq1rp5IqmEudEzWrWdOkMEeaM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CC86C9403F2; Fri, 15 Mar 2019 12:57:55 +0100 (CET)
Date:   Fri, 15 Mar 2019 12:57:55 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH v7 1/3] i2c: core: improve return value handling of
 i2c_new_device and i2c_new_dummy
Message-ID: <20190315115755.koqzgvlbbji3xbh3@verge.net.au>
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
 <20190313165526.28588-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190313165526.28588-2-wsa+renesas@sang-engineering.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 13, 2019 at 05:55:24PM +0100, Wolfram Sang wrote:
> From: Heiner Kallweit <hkallweit1@gmail.com>
> 
> Currently i2c_new_device and i2c_new_dummy return just NULL in error
> case although they have more error details internally. Therefore move
> the functionality into new functions returning detailed errors and
> add wrappers for compatibility with the current API.
> 
> This allows to use these functions with detailed error codes within
> the i2c core or for API extensions.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> [wsa: rename new functions to 'errptr' style and fix minor kdoc issues]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

