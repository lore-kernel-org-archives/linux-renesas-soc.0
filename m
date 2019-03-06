Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C57C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 11:47:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D87020684
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 11:47:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="uivg6By3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbfCFLrl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 06:47:41 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36284 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729534AbfCFLrk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 06:47:40 -0500
Received: by mail-lf1-f65.google.com with SMTP id x206so8705946lff.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Mar 2019 03:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=pFERtoCMsPz6kltMKG6ZUnFegpnmcnTaHqilMnX0Gns=;
        b=uivg6By3YB78QD4IJyLRZo1j0Gt0lwKgjAraVsTuHmZ20TwOaeV7d9I9G6ebWPlooB
         4Y08ibe/195hW3zMm//+EcslEMxd+h2xbY23yhN/fvtFj5SAkNrlbW9eG0I8cL0foULf
         TEp6XZg2WYA0nwmPXFN8hw0U/wxJxbzjB3j02ffvYx/qGaG+jf0IvufU5QI+t2gRe7Qu
         G8asboQnvc1CKw6OXhgWLByHQsuNr5/Qo0OCns75x9Z4w3Uhy9cnz8bAksvsnLVxlftM
         6ZQ8idHq1buyFPMcu95PeYPmIyA8uh+GWqJEkZlUV27eijMXVQozHrycQU8Wm4aoqQ3W
         HAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=pFERtoCMsPz6kltMKG6ZUnFegpnmcnTaHqilMnX0Gns=;
        b=O6oXJPgXhYHVqHmRYNmREqmc8k/rPf1yDm2qDsD6NtuLSipssvkbHS7q4ojZGuOQDk
         57BNiN5ctbCHoldSmVxHq+HDu3/LNf/DY4upommwYNoaN8F3RYaEctZHjzahKYF9dVCn
         mjjw8gxyiS9d/MGfFRqjH1ziJ1PS/rZuYXc+76mIMcaRpmAXIQCtrl+3OGLp48wHGtqa
         Ve2muqPJfJDqpMYpsJTmOKDq+5wozw9hynoQoU+N78CtTtepVc7VZKo0TDxQJ9QgdThb
         0nczlEXrBGcePb6Hgi7R/jDLHO6Mh6b6MYkv65xTBxHPQOqAM2jcBNM/wSmQxfOif753
         1kJQ==
X-Gm-Message-State: APjAAAXp8gJBjIf/TSFngiI30IdF6hmM4+cTpr4Y9vD6vEd3NaTtjg5k
        ysn9SOhAmmD/8LcCWMrhrzTNZldpB8A=
X-Google-Smtp-Source: APXvYqzC9AjM8597lXBiVABzNL0ddMxv9lErCpvVinh8NsN9q9pvB2VJJhwEj3UvouI4E1LZVWUfXQ==
X-Received: by 2002:ac2:4422:: with SMTP id w2mr1137099lfl.163.1551872857850;
        Wed, 06 Mar 2019 03:47:37 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id k15sm284837ljc.39.2019.03.06.03.47.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2019 03:47:37 -0800 (PST)
From:   "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
X-Google-Original-From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date:   Wed, 6 Mar 2019 12:47:36 +0100
To:     Simon Horman <horms@verge.net.au>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: r8a77990-ebisu: Fix adv7482 hexadecimal
 register address
Message-ID: <20190306114736.GA2750@bigcity.dyn.berto.se>
References: <20190216235854.15244-1-niklas.soderlund+renesas@ragnatech.se>
 <20190216235854.15244-2-niklas.soderlund+renesas@ragnatech.se>
 <959b482d-09a1-2ffc-1144-101348bb27d9@ideasonboard.com>
 <CAMuHMdXgPYkCi+pK9FsfsCuWtAL1Ly7d=Ty88+qGH7m7L67aOA@mail.gmail.com>
 <59664792-ce36-d068-077f-e6cd12dc549b@ideasonboard.com>
 <20190225100954.jvwbty52lgpcovrx@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190225100954.jvwbty52lgpcovrx@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On 2019-02-25 11:09:54 +0100, Simon Horman wrote:
[snip]
> Thanks, applied with the subject prefix updated to
> 
> "arm64: dts: renesas: ebisu:"

You took patch 1/2 from this series but not 2/2. Was that intentional?

-- 
Regards,
Niklas Söderlund
