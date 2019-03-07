Return-Path: <SRS0=HvZV=RK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B69BC10F00
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 00:11:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B37020663
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 00:11:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="y9nP7BEI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbfCGALb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 19:11:31 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45111 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbfCGALa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 19:11:30 -0500
Received: by mail-lf1-f65.google.com with SMTP id f16so10288059lfk.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Mar 2019 16:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=5TBagVUGAwhG9ItWzSk6SakNJxzInIEm22ftDRVatGI=;
        b=y9nP7BEITHfUyKYY8TKZJHEggzvOJgRboZ+XNMDG2IuRUvtthu46U+Av6zFCjwSz7Y
         9view2EIs37x0wnEcV6gacGRm5Zp8Cp5qQ0FkzwXuUNGjoiUkaq+l+c28wRQ/uvWO75E
         O91A7psOHBwdBl6b/pJZm4jL3e1BMWs2zWrGuPnH9Iyat0VjScLQeycAkQNc/BAd7o2C
         HeejIROVWuxJHIJfD84LGIMPuBW+j8t6EV1gupqxG2vaIo7UpLhOBEyCdnnRx4XQSy8x
         dwpyfLP3ZLsgabAeMVJ+FyUSGzxVJfkIlquJ1I1p16/p9003rEjiru7sgkFy4t/qMd66
         TnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=5TBagVUGAwhG9ItWzSk6SakNJxzInIEm22ftDRVatGI=;
        b=VBXPdEotMxON15FeNfNS1+dJNfK4lN5jUjzLUiGWguljExr5uR9WmgygDWugmtOb+E
         4MDBBueMonuVLrArG53URxhwmI7/PNgByBfMQTINH1Ztq4mAiExQqRNV+4dXAblZki1Z
         TUTClAbkRxd3kQlit2+ct5kr+dJKttZ0yhKuPmjhmwKb/N6CMMC9VqtX1Aijeph53r2y
         v0CjR4mHNzz+ondkO7OI8alRBDgBQCvbK+t7fzyhHJpGl0BtAltUrvbXpZ8/QPC6lKp2
         jxM0YeB/J8U4YccBx0YWgkSZu/ez6JKX0JYc0WrWVzCIdCNIeG13qyRhyCRAbGR0fy11
         dLfQ==
X-Gm-Message-State: APjAAAVbMj2snjkCnp+avmZQTu7yO1c0CJaf+t905tCKOQHZh16JcL1o
        Dqhs6jGiZ4KXMpeAvUcMmb/Z2PD6mNE=
X-Google-Smtp-Source: APXvYqzIEawJiKtaa1+DhrgLA0DXbGO+A3oFmY6LFgrMVrWQhYWJQEZyauUeWl01ggetwVE+E7skrg==
X-Received: by 2002:ac2:5294:: with SMTP id q20mr5711025lfm.12.1551917488421;
        Wed, 06 Mar 2019 16:11:28 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id s73sm107708lfe.3.2019.03.06.16.11.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2019 16:11:27 -0800 (PST)
From:   "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
X-Google-Original-From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date:   Thu, 7 Mar 2019 01:11:27 +0100
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] rcar-csi2: Allow configuring of video standard
Message-ID: <20190307001127.GH9239@bigcity.dyn.berto.se>
References: <20190216225758.7699-1-niklas.soderlund+renesas@ragnatech.se>
 <1a2b46e2-8d24-393d-4e7b-0b9cab777aa7@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a2b46e2-8d24-393d-4e7b-0b9cab777aa7@cogentembedded.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

Thanks for your feedback.

On 2019-02-17 11:47:28 +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 17.02.2019 1:57, Niklas Söderlund wrote:
> 
> > Allow the hardware to to do proper field detection for interlaced field
> > formats by implementing s_std() and g_std(). Depending on which video
> > standard is selected the driver needs to setup the hardware to correctly
> > identify fields.
> > 
> > Later versions of the datasheet have also been updated to make it clear
> > that FLD register should be set to 0 when dealing with none interlaced
> 
>    Non-interlaced, perhaps?

Thanks, will fix in v2.

> 
> > field formats.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> [...]
> 
> MBR, Sergei

-- 
Regards,
Niklas Söderlund
