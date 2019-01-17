Return-Path: <SRS0=aD2s=PZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870AEC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5680620657
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 17 Jan 2019 10:43:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="kDFmQHgB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbfAQKnQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 17 Jan 2019 05:43:16 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59616 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfAQKnQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jan 2019 05:43:16 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id DA09E25B760;
        Thu, 17 Jan 2019 21:43:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547721794; bh=nh7YhGaeO60gO69ps3ge2gsZRNgdya6RGrHCeuRYMng=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kDFmQHgBwj4AJ7OgFo5EUV19jaUUOf712p4H2YuW53jS/BAJRpb3GwdnmIOBG63b8
         JYG+TX8GLsoqQnl8vSwIwrk1zorDMNn9LFl+vIKDp5r+LzN660MHS4UzIkiCIeT9Qk
         Pr2KtKCKaOiAmj3XJo0wxxdgTY6c4n/7NXxXqe7A=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2DC72940459; Thu, 17 Jan 2019 11:43:12 +0100 (CET)
Date:   Thu, 17 Jan 2019 11:43:12 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] usb: renesas_usbhs: replace udelay() with usleep_range()
Message-ID: <20190117104311.zwr6fg3lip2xauec@verge.net.au>
References: <1547709855-32749-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547709855-32749-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 17, 2019 at 04:24:15PM +0900, Yoshihiro Shimoda wrote:
> According to Documentation/timers/timers-howto.txt, a driver should
> use usleep_range() instead of udelay() on NON-ATOMIC CONTEXT if
> "SLEEPING FOR ~USECS OR SMALL MSECS ( 10us - 20ms)".
> 
> Since the .hardware_init() and .power_ctrl() will run on NON-ATOMIC
> CONTEXT, this patch replaces udelay() with usleep_range().
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

