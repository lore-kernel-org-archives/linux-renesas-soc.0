Return-Path: <SRS0=y581=S7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B30C43219
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 29 Apr 2019 18:05:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AFEEB2075E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 29 Apr 2019 18:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556561125;
	bh=RCDhRox9fPBWQPkYpkb7fBJmK8OFG8FRypAbtGvGzps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Pk6963G4bO+4+0hi6gd6xLKV0pqx/TGXIbrhXYAkKuIHpWXW87RidtOsgmmGGNdKE
	 q+lAudr29RUqDWqTK2HVoyRoAk5DBUsCMDBjN+E6QPVt3KUGJKhDYg1dmn+kxS71r9
	 AL3buoe74n+VlGvnYuzq4iiHgi/H//djMiB3xQEY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728907AbfD2SFZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 29 Apr 2019 14:05:25 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38653 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfD2SFZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 14:05:25 -0400
Received: by mail-oi1-f193.google.com with SMTP id t70so3509612oif.5;
        Mon, 29 Apr 2019 11:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UqPzLmZywSZdWocGQtr3nDjawnkDeWesNb7vm3vXu2g=;
        b=FNVgEbaVqS/BJ5gdm0f1vUYR/mH0VCMIZGf35V+LGire8YfUl/CUKhYnepxMF+GldF
         jmiGxHfIFb05zMICArZiFbgVlGAbGcok28716G7416PnoUzAjrUJZ6RM/tZWhj3p9pUf
         9Rep/ovSOCu1axUaSDBsKDE7aFzfvt32cozE8RcMRPcnDeJYTMFMC64B662Mia5pcm6T
         R/Wnk5byEfHUNoWz7RYwZOMLiDd19+gNK+2njs7oO7YfnBw2MTdqcc8n8bBfb7z18YEP
         T2gncrkzQGC8R1/ChnkhiKaPiK9ZTDzS65cEL0mJ3XR8UQ2B1wUJe8DhWucpvFXaqaC3
         QzPw==
X-Gm-Message-State: APjAAAVqbjhRcNHXXJpLeXLI2nhCe6nLIS3KJGJjzIKeN3f8rMAibSjb
        hSPXqQPxH6xnLkWoX8SeoA==
X-Google-Smtp-Source: APXvYqy8ALw1hs5L63Iw5Cn6DjYRGJtr5g9yUra41zC/r/omvS7UZEknd00gLT6m+hff+9fUL6i6ag==
X-Received: by 2002:a54:4385:: with SMTP id u5mr284294oiv.22.1556561124443;
        Mon, 29 Apr 2019 11:05:24 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z3sm195095otm.41.2019.04.29.11.05.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2019 11:05:23 -0700 (PDT)
Date:   Mon, 29 Apr 2019 13:05:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, horms+renesas@verge.net.au,
        devicetree@vger.kernel.org, biju.das@bp.renesas.com,
        yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: Re: [PATCH v2 18/20] sh_eth: Document r8a77470 bindings
Message-ID: <20190429180523.GA24819@bogus>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-19-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-19-git-send-email-cv-dong@jinso.co.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 11 Apr 2019 16:54:20 +0900, Cao Van Dong wrote:
> Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.
> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> ---
>  Documentation/devicetree/bindings/net/sh_eth.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
