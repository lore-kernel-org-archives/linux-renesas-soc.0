Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4866BC49EA6
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jun 2021 06:36:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3330C613C7
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jun 2021 06:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbhFXGiT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jun 2021 02:38:19 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53538 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231234AbhFXGiR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 02:38:17 -0400
Received: from mail-wm1-f72.google.com ([209.85.128.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lwIxy-0004lu-12
        for linux-renesas-soc@vger.kernel.org; Thu, 24 Jun 2021 06:35:58 +0000
Received: by mail-wm1-f72.google.com with SMTP id o3-20020a05600c5103b02901aeb7a4ac06so2642803wms.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 23:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R0aLcGzQ8alnnx9N3rRdFLtO2M7ctE9WWithaXsLLWI=;
        b=RMlfE44/rCtNm1tbi7DDsOBpfmT0wLJY5Tzi6qE+1Qh3nl0SQWWh6JmJls1FP8L2pE
         gF+qCAyoSCJ7kRDe40ODst9s5diLtlkmmtB+jD5uqpkX9hDcJkNNUkd1WWfgi3Ds6Cg+
         E23bKcZkCKdUsueidr52gGO3fFT4Sp6ModND6BUpPvc3QxowFgBY/N99OsX8gS0eBPmb
         FGCKrFRl37fp3GgmMla2fm36EUEI0LxGsc2RBEJgRhGrh0Azlo4Xy9l8Pl5D1nRL3e25
         iIQQo9sGTgOIAFStJe4+ciN/+1z/X5NrlnTJmc3/IUizL2LRy+ZdqmTaYfwuD737IkY6
         B4XQ==
X-Gm-Message-State: AOAM531xZwJN1ARQTMelDF0HfDBmRsHdN5/cKLii1yfr8sTEsLnX3+6F
        fSwFdtY0Nx7ewVUL2eG2UGXuQhHImQo3/Cnvf2+sgKHsAP1eCziR/QC/IEhIfS4qDByxClmFQut
        Sn++ojpbknoTOtzN+l1UJDN7jV8oNcA9H9oL9KFWV7ADadzdH
X-Received: by 2002:a1c:a597:: with SMTP id o145mr2277259wme.53.1624516557584;
        Wed, 23 Jun 2021 23:35:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7R5Kid8X3SyYMWnamWceIwi3ZiQ7MY/ZL5RhUroHzBxtla7y73sqnE4+q/iG5Y5wgPNqwng==
X-Received: by 2002:a1c:a597:: with SMTP id o145mr2277246wme.53.1624516557384;
        Wed, 23 Jun 2021 23:35:57 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id m184sm1893490wmm.26.2021.06.23.23.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 23:35:57 -0700 (PDT)
Subject: Re: [PATCH] dt-bindings: Fix 'unevaluatedProperties' errors in DT
 graph users
To:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20210623164344.2571043-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <0fbde9aa-03c1-0343-3b6f-5a7945fd8df8@canonical.com>
Date:   Thu, 24 Jun 2021 08:35:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623164344.2571043-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 23/06/2021 18:43, Rob Herring wrote:
> In testing out under development json-schema 2020-12 support, there's a
> few issues with 'unevaluatedProperties' and the graph schema. If
> 'graph.yaml#/properties/port' is used, then neither the port nor the
> endpoint(s) can have additional properties. 'graph.yaml#/$defs/port-base'
> needs to be used instead.
> 
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>
> Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/bridge/lontium,lt8912b.yaml    | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/imx258.yaml        | 2 +-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml   | 2 +-
>  Documentation/devicetree/bindings/media/renesas,vin.yaml       | 3 ++-
>  6 files changed, 8 insertions(+), 6 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
