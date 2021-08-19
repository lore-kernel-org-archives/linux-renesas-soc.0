Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47167C4338F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 19 Aug 2021 15:42:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24C0360EE4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 19 Aug 2021 15:42:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240639AbhHSPmg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 19 Aug 2021 11:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240597AbhHSPmg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Aug 2021 11:42:36 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABF2CC061575;
        Thu, 19 Aug 2021 08:41:59 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id n7so12370530ljq.0;
        Thu, 19 Aug 2021 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hq7OkJw6lhOnwjh1thu9W+UEluZoGVXakS2C8zgonH0=;
        b=k8yfszsn2tI7rgWFNLWSlOqz3Ekr4Rujtx4yGp64/2WLCt0pmx4uZlADbZee9qJlKY
         ePg0SamTW6dS6YNC2T5S3mWoIqjWzPdTux00ZUzZ98qxfpAx53VgxN3u0Dp1XBMVM83X
         WqaT4JWeZJ15VNBXbNjaw2Ns2djaFhmt+/4GmdoHDJRrAf5RbMkRrAgGzOUIGdm5V9MR
         Tf7GKvG4s2dyctSWRHwyJGqzPBbaujTV6jYuHFRc3DEX2wJw1YVUet6hPVhpdYDUXLoY
         pNMGPEGY1PVPGr9iJzfXI+Zm7/ewMGdNLTkyj+XQ95/IAksMYEpui72B2t9gZXdci+0N
         RHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hq7OkJw6lhOnwjh1thu9W+UEluZoGVXakS2C8zgonH0=;
        b=WTyi74+/vscpe4eHXjmF6AHMG1IxYfQ2JxU3Vs2LlsB5+GgYcgmMcSL0M+bdT2cZs2
         oUyRU+p7pbBo4D2ZiFTb9CYkT2AUB5f1A5CJbPslAN7hY6qatmGF01DfXu9Lue4bbEDP
         F6kiR92wmMcmYE2hpaX3PNxs6etXAlRUsm0w03Rnm1VbaiEuKm9MWTaTjEXWytlWWqRQ
         FjFA0Gk7ojT2qMmuGmEhbg3dzNsnnaNwCgcn9woHRe4hfMb0OpuZiEt7ASC9hMiEaXOE
         kznnvI9ccbtkvrlwo7X1sGHrikU9c1frfXGxq7/HPzjG23ND5kDcDOVlVyEIhkQbP0+R
         bDxA==
X-Gm-Message-State: AOAM531VKWP7IRWrg7p/I4ZnqGFwF/3N2FnAdXoaciuZeLtnjOQjSjMS
        /Zp2t5X1jxWWzOdbpBTJ9IA=
X-Google-Smtp-Source: ABdhPJyOppg8lX6Tyya9qA+hCtDMNm6xkKAe2H8w8XAl3R1RwVGN/Jm1+EDsWJaHH93x0kjuFhZn3g==
X-Received: by 2002:a05:651c:106f:: with SMTP id y15mr12584102ljm.309.1629387718079;
        Thu, 19 Aug 2021 08:41:58 -0700 (PDT)
Received: from [192.168.1.102] ([31.173.82.177])
        by smtp.gmail.com with ESMTPSA id u18sm376568lfo.280.2021.08.19.08.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 08:41:57 -0700 (PDT)
Subject: Re: [PATCH net-next v3 3/9] ravb: Add aligned_tx to struct
 ravb_hw_info
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergey Shtylyov <s.shtylyov@omprussia.ru>,
        Adam Ford <aford173@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Yuusuke Ashizuka <ashiduka@fujitsu.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210818190800.20191-1-biju.das.jz@bp.renesas.com>
 <20210818190800.20191-4-biju.das.jz@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <bc5879a7-4c35-8958-0b37-8d6337eb95ba@gmail.com>
Date:   Thu, 19 Aug 2021 18:41:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210818190800.20191-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 8/18/21 10:07 PM, Biju Das wrote:

> R-Car Gen2 needs a 4byte aligned address for the transmission buffer,
> whereas R-Car Gen3 doesn't have any such restriction.
> 
> Add aligned_tx to struct ravb_hw_info to select the driver to choose
> between aligned and unaligned tx buffers.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3:
>  * New patch

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

MBR, Sergey
