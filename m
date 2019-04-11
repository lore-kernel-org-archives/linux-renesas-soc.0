Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C5FC10F14
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 15:18:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62DC02173C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 15:18:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="G4SldAj1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbfDKPSA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 11:18:00 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:40824 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbfDKPSA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 11:18:00 -0400
Received: by mail-lf1-f68.google.com with SMTP id a28so5016850lfo.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Apr 2019 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=1purSxZl5QUPhjuk+1/FqL4lrpBughcyEaK96F1BBGg=;
        b=G4SldAj1kjIyLlcYpkO0AljBnGQZnl6e/2OHdvtwtcuZWmL6+tGKEQ/3y3GZLAMf1R
         pdhtaKvQKhKWvwgi7jxd83nniv0LPoDKe+ZvfpBzYuUXr77zaRVspR5NZVV2mQeLgscq
         EABUlkqjBSQRoK54AxL1QGY55grLnq3iw32nZDq5CDn6p3X3dtqAx0OvedfvHHw/+cx9
         HoX3ueVQfOtlRsZ7OzlhM7U6N2Wq4LRUik0+KB37rdadIiHKIvOco1m7v7Q4c/H0wioI
         Uujnb2caYeeKF7yXY3nqhsUto0S2+84yy/hS8YWrtPjCMRJgNhHPhwtKuW9D8YTsnLWO
         /WkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=1purSxZl5QUPhjuk+1/FqL4lrpBughcyEaK96F1BBGg=;
        b=cqqNcfWehSSUfNVQjE5HQqRR9xyz9kUn6b2w+6VvF0hs/+sFIoqaqyrE28KdfuNi3Q
         Ula8szDoJ8hOQqebLN1H3vnSGHsf379QpmV+Ytr5xHFSgWoQwmQIJEBVrl16Y48p9Kdf
         AKEgQGvkmNp5O0l7UHVaKxIlvPWnyB9HB2R5Ok+EjEVsYLPpLPs0VBe+5aH/pgXgIMo0
         cHodmjKLHzHHRw7MBcpHHdiS+mgQ/F0byAnEbWq8CbOuCOMJuz7o+0cATuqsML8BBjEc
         qFw6l2sbLqeodgLg5VicUHK6BmdQncbWrOeyC8qEU3rUOQYZ5E1FN8RD53koykZuuqfQ
         bzrw==
X-Gm-Message-State: APjAAAUKvapV426CvoWgfAn6pCihsvfD/JCYi22TrP3nchokRG4upxql
        zU7R2Pmb3mID8DyQ3qvlML9+mw==
X-Google-Smtp-Source: APXvYqy4kulDtwTktJoMI0d3ErXK91CqDAzbobQ/HBN88tdKfSmuuLh77Xn3ktJINkTbqHBg+V/c6w==
X-Received: by 2002:ac2:4148:: with SMTP id c8mr27687265lfi.2.1554995878523;
        Thu, 11 Apr 2019 08:17:58 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id 7sm8409928lju.27.2019.04.11.08.17.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 08:17:57 -0700 (PDT)
From:   "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
X-Google-Original-From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date:   Thu, 11 Apr 2019 17:17:57 +0200
To:     Simon Horman <horms@verge.net.au>
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
Subject: Re: [PATCH] dmaengine: rcar-dmac: Update copyright information
Message-ID: <20190411151756.GC30887@bigcity.dyn.berto.se>
References: <20190410182657.23034-1-niklas.soderlund+renesas@ragnatech.se>
 <20190411084937.y5m6vzcwtkqqun7s@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190411084937.y5m6vzcwtkqqun7s@verge.net.au>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2019-04-11 10:49:37 +0200, Simon Horman wrote:
> On Wed, Apr 10, 2019 at 08:26:57PM +0200, Niklas Söderlund wrote:
> > From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> > 
> > Update copyright and string for Gen3.
> > 
> > Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks.

> 
> > ---
> >  drivers/dma/sh/rcar-dmac.c | 4 ++--
> 
> Not strictly related, but is it appropriate to:
> 
> 1. Move this driver and drivers/dma/sh/usb-dmac.c to drivers/dma/renesas/
> 2. Remove drivers/dma/sh/sudmac.c which appears unused

I let someone with a better grasp of history answer this one. From my 
side removing drivers which are unused seems like a good idea :-)

-- 
Regards,
Niklas Söderlund
