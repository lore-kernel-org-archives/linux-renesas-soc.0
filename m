Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1F6C4338F
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  6 Aug 2021 20:31:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BDD661163
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  6 Aug 2021 20:31:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbhHFUcB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 6 Aug 2021 16:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhHFUb7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Aug 2021 16:31:59 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F84C0613CF;
        Fri,  6 Aug 2021 13:31:41 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id h17so2248693ljh.13;
        Fri, 06 Aug 2021 13:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SNGIyJeSN3Wn92YqPN78qZBm9w648CwT8vppURAnW2U=;
        b=eCKNmqjcgH757HdMfmp/mzvZLkmsER7KEpZAwys9qv5QHjwN5iKrrtP+OJvxxJ0bCd
         sWR3PaXkuUxgTrpxIcAprDWoWrKdpl/EqlLQ0kgptx/WlBs124RyriYUjQlvACmPsb1x
         ODiqkx50APNCFBsIrPW109uFfGYr8U1uoOC9xGjZsmCaSYFOgWSLtjQoPFsDMq6/Wbv2
         0MZlJWsoF6KMTGhQsLHvvxU2bv9QhmG5Ox/3A/Mxfjs+sOqhRxVR5LWeePpDrZSaegzK
         ncR7PthFf7zmurNqhs0zMJ3ndDJFoxAUMa7E42mPOLRxUfT+VMG8JZaZNCsg903IoH2C
         eCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SNGIyJeSN3Wn92YqPN78qZBm9w648CwT8vppURAnW2U=;
        b=jw1zAs2M0L36ctcQsPG0rq8P5WmCX5NSpyXwmCp8yedvGjc/AMAC6qAFpFc4kMhLw/
         IfrWv+M2fu3CiqkPd5xRWeniONskk5oAbbcVX/JIozbE3KMaxhXTNa35R5Timp+ZztoV
         FOCoZjoYYgnfeOd6hOlGVdbp/2Rwe4ninADzbEy/iHjAUf3wMaBzznmJ6YXjDTmQSuuR
         llGxx/9iUMtPnnpjQBiiqy+LTLqM5JSF/EFpfPF7B1dnOmTlSBeFk339plx3TWisTtRA
         ute7Lni+sp244BJzD1huHSZe5yA6fbK3wgsa3rhWo0QHXHgbeo41GVpI0zQD7LaEwXll
         WLGQ==
X-Gm-Message-State: AOAM530wPPMij/spXBVseVj/APPtUwRVXCUhjQnlPBfDvsA2BnIpY19K
        Fd6K7r78aTNjVJKzjT3eals=
X-Google-Smtp-Source: ABdhPJzh8RJgrBpw4NWlECwNDCbKBlPUHRbDy44RQmVSzlCYf1iewKtlNFZfS5DrcTkGlFPWYB/R8g==
X-Received: by 2002:a05:651c:1143:: with SMTP id h3mr7612068ljo.300.1628281900276;
        Fri, 06 Aug 2021 13:31:40 -0700 (PDT)
Received: from [192.168.1.102] ([178.176.75.100])
        by smtp.gmail.com with ESMTPSA id p25sm381650ljj.20.2021.08.06.13.31.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 13:31:39 -0700 (PDT)
Subject: Re: [PATCH net-next v2 6/8] ravb: Add net_features and
 net_hw_features to struct ravb_hw_info
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
References: <20210802102654.5996-1-biju.das.jz@bp.renesas.com>
 <20210802102654.5996-7-biju.das.jz@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <6aef0ce4-87b7-944f-9750-4311d3823163@gmail.com>
Date:   Fri, 6 Aug 2021 23:31:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210802102654.5996-7-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 8/2/21 1:26 PM, Biju Das wrote:

> On R-Car the checksum calculation on RX frames is done by the E-MAC
> module, whereas on RZ/G2L it is done by the TOE.
> 
> TOE calculates the checksum of received frames from E-MAC and outputs it to
> DMAC. TOE also calculates the checksum of transmission frames from DMAC and
> outputs it E-MAC.
> 
> Add net_features and net_hw_features to struct ravb_hw_info, to support
> subsequent SoCs without any code changes in the ravb_probe function.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@gmail.com>


[...]

MBR, Sergei
