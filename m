Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8915DC433DB
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Mar 2021 07:11:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 544FE619AB
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 23 Mar 2021 07:11:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhCWHKp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 23 Mar 2021 03:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbhCWHKS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Mar 2021 03:10:18 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F46AC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:10:18 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so9734105pjb.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Mar 2021 00:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=ZvTzLCdLPjV6sP5Di5nlO5mOmXJgD3ejWOZlWZGKiiI=;
        b=IcyvPv1ZgDHA6AxCZDxgZAJx5zoNZy6JEWhnk25DaBcPaqvZn5es1U1kKssqQ2LjYA
         LEOVWt1VA6F4TLHYUpn02wUHrmhXQBM/IB9lKGzE2BVymNQUz1GaCeNlkWK0V8NIT1Yb
         UvSiEBCeeKkUow96bjK6I03aZ7+SuP+rSld2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=ZvTzLCdLPjV6sP5Di5nlO5mOmXJgD3ejWOZlWZGKiiI=;
        b=kInCshcSDjyiNl0xXluhg9jtLQXASPXNPUQknfqcKeWmFX4qMnH9+bfclQ87ji4iWg
         LTGXpaKA2ND/AYp8LA/uLV7icR8c86KppfkQphJi7dwajAZETalUB2Be0zbb0NLeBRYh
         2lN+C9GxERvGX/tsLKuYjrkj2v56WUxIRmExYYcL+uGFzmYJUOuLrOCC0AjSVrCxBeHT
         +2I6wjCJr3gxIL85jtpJlbkA/bVZgsAIZ07S38mXzx3weOSldqjrW0EbBezDE6Bv/kHF
         BpKqrxdnDkOGBZ1Ski5nqPzkutUm08dFvSVxwsd1BQaXnuJmCqLNRrR7P3q4OTgl8rls
         DOqw==
X-Gm-Message-State: AOAM533dntunsUBnWx/hcycAoQt6Sg4DixJRy7Z8YJb7I79XSHSX6kjc
        yO36zBT4NUh9ALKM3qtT158gAfRXyPI2IQ==
X-Google-Smtp-Source: ABdhPJy5OaFHCieFuxyB1zp72GYOQUuVp2Xx8UJd3BAyrzhCoOgzRAT7gO6bO0J/EJhLyJfp7Jul7A==
X-Received: by 2002:a17:90a:458b:: with SMTP id v11mr3032512pjg.189.1616483418081;
        Tue, 23 Mar 2021 00:10:18 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
        by smtp.gmail.com with ESMTPSA id t18sm16901438pfq.147.2021.03.23.00.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 00:10:17 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210322030128.2283-3-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com> <20210322030128.2283-3-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 02/11] drm/bridge: ti-sn65dsi86: Make enable GPIO optional
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Date:   Tue, 23 Mar 2021 00:10:16 -0700
Message-ID: <161648341624.3012082.18051339783564610283@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Laurent Pinchart (2021-03-21 20:01:19)
> The enable signal may not be controllable by the kernel. Make it
> optional.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
