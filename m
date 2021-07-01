Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0585EC11F67
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  1 Jul 2021 14:06:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEC0A61350
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  1 Jul 2021 14:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232802AbhGAOIm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 1 Jul 2021 10:08:42 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:46613 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232663AbhGAOIm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 10:08:42 -0400
Received: by mail-io1-f50.google.com with SMTP id f21so7588678ioh.13;
        Thu, 01 Jul 2021 07:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xxMOmmycUeqjkF6/9iAYY/xBPx+Z3Ak6vPJYeSn/FGU=;
        b=PTirxwEgqbgDzc+MJXZwM9FMEI5hsbKah8VfTuESG5G5maU0RolNWqcaMKSTSVdbFc
         UKcuQq3iyU7pFUmqE9XMYOpymP2LK2tjPoKGRVzEhTawny5iDohDCsU15XS6QkPVqiFU
         L7NanpRjshyWpVkGtNLgymaZ/MArjkuQ6BPKw4ChT2XE00fcbR7bi807wKUp/ovkhop8
         eEhNOvkunkyWdrd+uimDsa3cbbPZw6PbgU4DmI1aXEIN0891MVoecAb1CTWi7DtwLJzi
         vowQlKid8D4Qm+Lxoa8Bs1fKddjQ1JWuSz1Lmxmqk139dJQk3BGpv5LKSssuYYDkJQ2m
         +VKA==
X-Gm-Message-State: AOAM5313xoerfEYHuPBQapqfA2RW9yi9rGO2DxWfqRZp+Sp7iGzxJhq2
        4yNZKox26dK1tWHOoef5gw==
X-Google-Smtp-Source: ABdhPJx9rzkgIl+rsWHg19i2yFMTDtBgIlIZSmZtKkXMTMpHMTWA9yzsgev81Eq6wGhVWbaycaP2/g==
X-Received: by 2002:a05:6602:2be2:: with SMTP id d2mr12476469ioy.116.1625148371436;
        Thu, 01 Jul 2021 07:06:11 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w15sm20298ill.84.2021.07.01.07.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:06:10 -0700 (PDT)
Received: (nullmailer pid 2284825 invoked by uid 1000);
        Thu, 01 Jul 2021 14:06:06 -0000
Date:   Thu, 1 Jul 2021 08:06:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dt-bindings: display: renesas,du: Fix 'ports' reference
Message-ID: <20210701140606.GA2284716@robh.at.kernel.org>
References: <20210623164308.2570164-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210623164308.2570164-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 23 Jun 2021 10:43:08 -0600, Rob Herring wrote:
> Fix the renesas,du binding 'ports' schema which is referencing the 'port'
> schema instead of the 'ports' schema.
> 
> Fixes: 99d66127fad2 ("dt-bindings: display: renesas,du: Convert binding to YAML")
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
