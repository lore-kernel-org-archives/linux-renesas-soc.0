Return-Path: <SRS0=Wh2G=SE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA75C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 12:49:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5AD7D20883
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  2 Apr 2019 12:49:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="VCsX+vpi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729625AbfDBMtb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 2 Apr 2019 08:49:31 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34015 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729576AbfDBMta (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Apr 2019 08:49:30 -0400
Received: by mail-lf1-f65.google.com with SMTP id y18so8915767lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Apr 2019 05:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=rc9Nw3K8yky0b7HH2PEcKLi0yB1XScOG369kR1770m8=;
        b=VCsX+vpiDsT3fELjo/7T6Qb/Fy6SOPhRcg+qPPXpHGVhX5O85Nr8SnrDsRIkL3om00
         AQ4Af6cV/yO/grD0d/pmhPtvcHqllQBX3Qx4Bat/d8lxXvuCX53C53mi5qBMJeWA2IqP
         ZgHV+ZSqW+sdgeLNZAxSss57TBzpu8R7dxaXUa6pqfwXxFqAWWWsQ5sSfQpLBMJsmV/M
         B8SXO3drRXnwOwCpzWGVQtGJllPMMPoYzDU33Lz6QvEeGSbBuIjKiVXfx4OHilc7AhMU
         4/Rb8Pn1939H+1ezCPJOCi+rky3+cqY5ic1bBOv8Mmp9NUrn1hBeAPuZ9SO74a2mbAnH
         GMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=rc9Nw3K8yky0b7HH2PEcKLi0yB1XScOG369kR1770m8=;
        b=Ik+u8bjzWMO8Mr7HB7xeNhQw1G2ZLhQpUIhaiLyk9ZyNkXZAtKeahV9CPCm7AEF3nV
         +yFutT3/sCAR6aamgg/AUPbgHAp6YDVHnKXnlAh6OIfEzY9HkJMcHmXXOCqu/xYvuMs/
         GZdvG6wyUTalpyaAhpLw1JIPdGiu5nfuEWa38EtD6752jbCgPQNGY/0v3NbOcFFbrJMj
         PMKWk+fyF2WdNX2gsv09RHf7BxZOwtgL48Vi7w0+HbGTCnScT5smuw/O27Su8F+pKHrx
         RgEx1jzBZF58WPq+Y4lTkvdyVVRxsdgtdFM9yq5cEV+n877KPwuFO2agAaHFbjUYzBN2
         vs9g==
X-Gm-Message-State: APjAAAXKH+ONDmPxk8HIkcjUNVqZa/qg73/H80PCYDdp6Q8rW+vM3zgO
        eS+Qfcek+t26E7IjCrrW0+Z5/Q==
X-Google-Smtp-Source: APXvYqxDaW0UbOyL/9aInZSxCWJh3z9yaQBHoUMEB9vH0W9WPCp2oWUqlTumJ0djgIfjHpOSuElyNw==
X-Received: by 2002:ac2:5501:: with SMTP id j1mr32593693lfk.113.1554209368727;
        Tue, 02 Apr 2019 05:49:28 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id k21sm2682503ljk.21.2019.04.02.05.49.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2019 05:49:27 -0700 (PDT)
Date:   Tue, 2 Apr 2019 14:49:27 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: shmobile: defconfig: Enable support for CFI NOR
 FLASH
Message-ID: <20190402124927.GX23466@bigcity.dyn.berto.se>
References: <20190401120150.30687-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190401120150.30687-1-geert+renesas@glider.be>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-04-01 14:01:48 +0200, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> Now the DTS for the r8a73a4-based APE6EVM development board describes
> its CFI NOR FLASH, this patch series enables support for that in
> shmobile_defconfig and multi_v7_defconfig.
> 
> Note that kernels built from these configs cannot be booted by stock
> APE6EVM U-Boot, due to kernel size.

For the whole series,

Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>

> 
> Thanks!
> 
> Geert Uytterhoeven (2):
>   ARM: shmobile: defconfig: Enable support for CFI NOR FLASH
>   ARM: multi_v7_defconfig: Enable support for CFI NOR FLASH
> 
>  arch/arm/configs/multi_v7_defconfig | 4 ++++
>  arch/arm/configs/shmobile_defconfig | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> -- 
> 2.17.1
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
