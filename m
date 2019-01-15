Return-Path: <SRS0=nIvG=PX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AD9C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Jan 2019 16:25:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8630520866
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Jan 2019 16:25:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="qwCMxAEc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728619AbfAOQZq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 15 Jan 2019 11:25:46 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39475 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728760AbfAOQZp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Jan 2019 11:25:45 -0500
Received: by mail-lj1-f194.google.com with SMTP id t9-v6so2861097ljh.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Jan 2019 08:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ubxea0/rT7CDOv0NUiD3qSKTwo4EZXjho29WNgHSXYo=;
        b=qwCMxAEc6eb/z2WpUEf4STe5dorwVPo83hoymi3gfq5y86o9BHubMWYoZJ8joEYwSk
         rTbpYIxVgoXuNuAvt4+IvQStBeoh7UpCafzfXaBlCzH2+bjVkSR+Niub9KhJbnLelucv
         qR3ZyXl9DMeNMRWW6zfLiZsXw1rEn7SO8EjbIDhFvOrt3hgBcGyMcTM6xMRd6V4VP7qO
         fqesBx6626SBcOzryzfR5JTWvywX9TcGavsXRsrsHl54ijvnEe7RFQVQ/UXTP4hSy/uV
         Gqfa0KDMW7ny7Spv90hP017qtJcDC2kSlnrAkT7ILjKYwbVKdKDQENfyGczzxBV0RjqI
         ic0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Ubxea0/rT7CDOv0NUiD3qSKTwo4EZXjho29WNgHSXYo=;
        b=sVlZq+wx8unv9O8zBOK/uoC6XWxc/lGAtJULzEYVnRaty9Lz2p4+WW70uQDNrDSBDX
         ZgSjpyCvfPV+Gn34CBB/f2yw/DUd0G3WRQrOoEILOUaRML5aPiCr05G6GtayuIL47f0N
         GaHALlz2xiywy0TegUr9IZAFOOYNZnZf2mMoKYLjBJ1/Uxg0Xin2qp/SHbypn1p3vhTw
         OaFVyOhw5B8RvJvMUt/E/ndukLk5AUja54+l/tAtcVp+Kw8thVR78kYjs1yiElSqs6CO
         YEQKwJyX6gfIDXEpp5gDRG733OLJinFB2hH3hD/NO5YFTrPJH/GwnArRjI6hpG6HJMMz
         y/Og==
X-Gm-Message-State: AJcUukeAjjX19YJz79jNsKYUB7r733OEPgWncSrb0erjcoAMu/lDGf9h
        52liTsqmlw2CPrazZOg/JPK3Wbf74qM=
X-Google-Smtp-Source: ALg8bN42p1KDSUUdJMYCOqayhrb5qtLvabuFa4XXr0a0J2czh4m3ykMsJBluIcSapfVJtz/eYUAJZQ==
X-Received: by 2002:a2e:484:: with SMTP id a4-v6mr3392538ljf.27.1547569543401;
        Tue, 15 Jan 2019 08:25:43 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.81.69])
        by smtp.gmail.com with ESMTPSA id p77-v6sm725657lja.0.2019.01.15.08.25.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Jan 2019 08:25:42 -0800 (PST)
Subject: Re: [PATCH RFT] spi-renesas-rpc: manual read issue workaround
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-spi@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>,
        linux-renesas-soc@vger.kernel.org
References: <76eb5af5-756e-4d54-0be2-55573649d2d1@cogentembedded.com>
 <20190107181505.GR9570@sirena.org.uk>
 <e56eec35-9628-9c75-4a8d-685ffef5e2b9@cogentembedded.com>
 <20190108122907.GA6590@sirena.org.uk>
 <09bc4c3b-cd23-753e-0a26-a74c30ec3cf6@cogentembedded.com>
 <20190114224740.GI11073@sirena.org.uk>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <ad3b12c1-e1e7-9896-ab60-567ae190bf61@cogentembedded.com>
Date:   Tue, 15 Jan 2019 19:25:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190114224740.GI11073@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/15/2019 01:47 AM, Mark Brown wrote:

>>>>    As I said, the patch was atop of the RPC-IF driver patch by M. Yang.
> 
>>> Please don't submit patches for things that aren't upstream upstream.
> 
>>    Even with RFC/RFT in the subject?
> 
> It's certainly an issue for the testing side of things if someone needs
> to apply it on top of a patch that isn't even on the list in order to
> test!  It's obviously OK to propose changes to a thing that's currently
> in review but it it's something nobody is even trying to upstream then
> that's less helpful.

   Hm... I'm seeing the linux-spi ML among the addressees of the RPC-IF patch
by Mason Yang. and I'm seeing it in the archives:

https://marc.info/?l=linux-spi&m=154563438006940

MBR, Sergei
