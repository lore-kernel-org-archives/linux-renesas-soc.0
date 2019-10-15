Return-Path: <SRS0=Zc5b=YI=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36033ECE588
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Oct 2019 17:20:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01DEA20650
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Oct 2019 17:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571160040;
	bh=KNYZpsldFe33XQHq8YxC4an+ZrNWQskZXnLykrKJens=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=n+kxiWmKvWAGx1JW4lht2XRQ1udbbOt01UEj2KDJErvdr++ler2/nVzDl3p2nLISF
	 StfZZUiZfogKQLSIcWG2moexEoUKYjb7XdrvlAytguTr02LjMNFo7Sz7/m4UluCMuS
	 lW16PIo2C/156zwwWqdndyhZNalDvbuogdCmGPyo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbfJORUj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 15 Oct 2019 13:20:39 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45716 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbfJORUj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 13:20:39 -0400
Received: by mail-oi1-f193.google.com with SMTP id o205so17490272oib.12;
        Tue, 15 Oct 2019 10:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wKUonmX44NtVtnepxXZgiGOB96dX5/QLIOzfgVX/AFU=;
        b=n93GT3abV+cA0d6NpY+SPgpGQXez70AKevZ1kMGwKfo+92N7wZAbJH3m+pvxkSf5V5
         frxqM9gFor7hVNJw7g+azuxXLPqlsa1DCOmPDSxiQc6YV24TJO42JS9QeMkrYkSmDGGe
         3oJRyRfbuNk3+hwj7l7k7rBewwLxQhTSrpbPGGPfII1sniXO3ffTnSt4PJ6M5fEYjeha
         L5TicXR9YOaVYjzzdlMbB4gbgif8A05nUrxtOzJMascLvdUJqzcue0L09CIF6PwMu+us
         IM+j+m/rY1hB0rhV8CMJGlvecSSVYJdHA5Kq7YOe9TCNavUSAPJusgEU7kzTzEJ/hMJ2
         EZkA==
X-Gm-Message-State: APjAAAUIHNIjrr1P11tGWLxQBb3Kw+3jk6bjrTi+0VXtdRTb9OrUjbGo
        cPwtgCF2Ula7nKwTbsCQ8w==
X-Google-Smtp-Source: APXvYqxK4bRV+aeiH8lROqFmXYgXyjLf8TcsIKjrzu6Bz4sp4gLXuBU/BAgvvv2z25oaQ2wn6nlsBg==
X-Received: by 2002:aca:4142:: with SMTP id o63mr30029674oia.81.1571160038400;
        Tue, 15 Oct 2019 10:20:38 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g8sm6369571otp.42.2019.10.15.10.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 10:20:37 -0700 (PDT)
Date:   Tue, 15 Oct 2019 12:20:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Biju Das <biju.das@bp.renesas.com>, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pwm: rcar: Add r8a774b1 support
Message-ID: <20191015172036.GA27358@bogus>
References: <1569931360-17196-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569931360-17196-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue,  1 Oct 2019 13:02:40 +0100, Biju Das wrote:
> Document RZ/G2N (R8A774B1) SoC bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch depend on
> https://patchwork.kernel.org/patch/11154813/
> ---
>  Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks.

Rob
