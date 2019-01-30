Return-Path: <SRS0=dpDL=QG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60E9C282D9
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 16:39:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C9122087F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 16:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548866374;
	bh=Z2wmThB/amC1ixuOzmIEbBPezUO8pN4pzvfim64L8q4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=v3dlyR8/CM4/ZdouTSZEF512+wY3WGG2Wkr9SPn56zLjLu6faeBWW2m6iQ663pkkT
	 hsENF51hNoTch1pzkDEyYfgTWdx1Y8hOZy5hu4ClhRzdPkq/kM+gr8up1DkOdElyI6
	 ioRKSMIjOKQlcCrkOWzR9FLnSIqI3Z/DR+EIZwkk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732106AbfA3Qjd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 30 Jan 2019 11:39:33 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39162 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731496AbfA3Qjc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jan 2019 11:39:32 -0500
Received: by mail-oi1-f194.google.com with SMTP id i6so141855oia.6;
        Wed, 30 Jan 2019 08:39:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5+RuO5TgEP1O6Himj48KkgKqe/Y/5F1FWCEPZc67RtI=;
        b=HFbgDn00X/L/TGYP3z6mJdfUhwX3KWNA7isLB04UAzRiBzkmM1OVw7BirkQVtpDjre
         fj4lHzVQciShwf1W1BT2ZQGS91PwOGUcxxIVaYm0NIocU2k25bwY8WtbMRr2+m5HYerx
         Agr/BM+UFcGeRVwXQGxN8VwXezA28ZvII0g6r2MnwkZiUqB2YdVWQNqcQMjyoWiL6N4s
         agrsLAKOkZA12IUvIJt+ASVDDWeoAIJuMDQT68sB35AKbrQYm9DCL8pJxkjc2opNH2cB
         P0353DPg3K+RVS8verischtSlO+pB5fCpPr1QUc6EVeSm56q7aIZsT04DsSyNlRofb3L
         4BqQ==
X-Gm-Message-State: AJcUukcdoYOfDweBWQcjOZcMVSzYQbxcQOFWxBKEI4ALO1jyVVMyhWoY
        FEYdzaAEubMXs27r0HD7EA==
X-Google-Smtp-Source: ALg8bN6ZvGRtZg8Hjk+LB+DT4QLuFC3E6dgb/xTm8O1TqFUJSMs6g4CgsGKDWYVb0DDw/YJjdghvZA==
X-Received: by 2002:aca:e401:: with SMTP id b1mr12223720oih.231.1548866371760;
        Wed, 30 Jan 2019 08:39:31 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b128sm870422oif.7.2019.01.30.08.39.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Jan 2019 08:39:31 -0800 (PST)
Date:   Wed, 30 Jan 2019 10:39:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: renesas: lvds: Document
 r8a7744 bindings
Message-ID: <20190130163930.GA31687@bogus>
References: <1548170749-12773-1-git-send-email-biju.das@bp.renesas.com>
 <1548170749-12773-3-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548170749-12773-3-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 22 Jan 2019 15:25:46 +0000, Biju Das wrote:
> Document the RZ/G1N (R8A7744) LVDS bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
