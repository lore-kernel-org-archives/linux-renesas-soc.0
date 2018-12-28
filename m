Return-Path: <SRS0=txgz=PF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131CCC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 28 Dec 2018 10:42:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CDA0620855
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 28 Dec 2018 10:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="rEKIC/uc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732042AbeL1Km5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 28 Dec 2018 05:42:57 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36422 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730497AbeL1Km5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Dec 2018 05:42:57 -0500
Received: by mail-lf1-f65.google.com with SMTP id a16so14324883lfg.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Dec 2018 02:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=FchOIF31NQHF5VrF3o61h08IETCzJg/tYPOHD7iIz6E=;
        b=rEKIC/ucpMw4x5HO6eoJVTyCmMHWZZwZzKXUvUm+fbsZDPrSzDh4LGecDqNBYejg/+
         2y4oLVwocIh00QqSBODJBJmfCU3cckkBmaqOMr2353r+YMOKqkRoOxISb2e8UZbmsTne
         N2b6lbl8ut457biX8APT04v6n8X0WB3bivKgE8+9Ur9SBWrzEXeQ7HFe20aiGouwx9k+
         hfJnUVARHhT5Lqu5y6WTOH9ehhKHj9E2wkc2GXy8IVn4uXrcSvnSYtcPE9s+hwc7WgVb
         M8RUMclz99doNGdO/QGQZ4tO9uiqQuEaXFA7KpQdzb8+PPoEKpqUF73xcWNsEMld1Tsj
         nFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=FchOIF31NQHF5VrF3o61h08IETCzJg/tYPOHD7iIz6E=;
        b=ozsJwg5TEBxsMBI6nB5zvQ1dmK8LhX35aaRyuYmIJM6o1Uizztnoab+euE2FfpnORz
         1N+24dOZTkIGIsX26y1bv2pFA6Nrvyx2RJmTPdBWh5REGkQidgEzVyMCkB7BU0WCsQ3C
         2f/Alw5rDcUI9zPxT1RaDOSaNTmUXXuMrpsIkFkB2ZddAmRvzyd5sg0g5sJQ2t+oT/d0
         1N2wsAHIra77gOFHYpTAy/lRFWTByN7NpapIatIXS0LlJ1x8DCKPFh6/HFCOhOErnSgj
         zZqoJES2zpgK6sNpT9rsSjC2Mwg40ZAzD3W2WDmbw9WOYx7Ha0HQwMLX2p0eTSR/iGLg
         4SGA==
X-Gm-Message-State: AA+aEWYoWxlpE0t0SegcihTDp+OzjIitvxAX2zJgNjMtlXrybjdiLk1A
        51ofbq2ZdizaLPdTJYXJ7Bihzg==
X-Google-Smtp-Source: AFSGD/XTywt0YhynGmWIpQl37/+w5sHWBfPcVefwFpaQ/OwP4weHRMMIUHkE+FlEJYchwn3JTW7NjA==
X-Received: by 2002:a19:a28e:: with SMTP id l136mr14777491lfe.87.1545993774903;
        Fri, 28 Dec 2018 02:42:54 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.86.72])
        by smtp.gmail.com with ESMTPSA id x24-v6sm9365404ljc.54.2018.12.28.02.42.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Dec 2018 02:42:54 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] Add R8A77980 support to the Renesas RPC-IF driver
To:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        Mason Yang <masonccyang@mxic.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
Organization: Cogent Embedded
Message-ID: <72626acd-9d5f-14a1-6464-5fdeba17fece@cogentembedded.com>
Date:   Fri, 28 Dec 2018 13:42:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

Here's the set of 2 patches against the 'devel' branch of Simon Horman's 'renesas.git'
repo and the Renesas RPC-IF driver/bindings patches v4. We're adding support for the
R-Car V3H (R8A77980) RPC-IF...

[1/2] dt-bindings: spi: renesas-rpc: document R8A77980 bindings
[2/2] spi-renesas-rpc: add R8A77980 support 

MBR, Sergei
