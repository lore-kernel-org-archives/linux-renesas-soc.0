Return-Path: <SRS0=voFw=X3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AB8ECE58C
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Oct 2019 14:19:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C546821D81
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Oct 2019 14:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570025961;
	bh=YhQa+y3gvjwmoqBRjt10mwS56Hyb0IubdaZYtFNbyRE=;
	h=Date:From:Subject:References:In-Reply-To:Cc:Cc:To:List-ID:From;
	b=J2C2VosH7XCDwOztZG/EUAQGiveSVdzn9uRm1MQrz5KGjVeIcP3ewX6oZH3hEcJXT
	 PD5vjQJVJ4hflnowBY0fb2nziIu9Bgvdfq4FDkynKXUXHmn8n8JIvrnsEiRElokYUf
	 60TFG0Y0nW2qdcamlvkpkBMWBRwOxZqrPtwjmyfM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbfJBOTU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 2 Oct 2019 10:19:20 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:36421 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728198AbfJBOTU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 10:19:20 -0400
Received: by mail-qk1-f195.google.com with SMTP id y189so15163426qkc.3;
        Wed, 02 Oct 2019 07:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=/g/bbjRXWIhyuedaUtM+DnOKt1qeleiyaAtpEEE6Mwo=;
        b=dDSaNIqdsPk/P+O41t8FtOvEzoA0DBQZSuL08iwkP4bQJdrV/YFkOsbFmmCUigzvx8
         falSnFLywpQsegqFopewd3rnP8bPQ+6bOCB2lWG/3L0NcBOl98KYRihk6huC+fP6jfLp
         zZgzMFUKJ3oaV3o1MPf4LJIu/F7M9csd26Zuo+SHWohDEzZ6pEgZvxmA7kFVNzUe3qIW
         zOiT1seFwahGze9ke3E0BQG4Q/+wM4GixmOJYKZYqvFG/LqnbODH8RQmNZu0jgDB2+Ue
         r7EcdocqCtuHO+kaqzlfDuTFLco8BVQHMqiSW4hWQZ9zfTxEHPMd8B1gNiK9XEHJsvwU
         aJsQ==
X-Gm-Message-State: APjAAAXtcmQ0L/TPTgwaqdjmbIrmmWxu+SJiCDL/yROaG0iV9+gdTetW
        iyHHnzDvpY+3LeHIrSBIOw==
X-Google-Smtp-Source: APXvYqwknSPp17BhwiC82Y+Cehmo0HSBHvCVUtVk0DuVwbSjaUU3vsj7A3AE9GwLUdIX6OJk1rCQlQ==
X-Received: by 2002:a37:9c09:: with SMTP id f9mr3809653qke.133.1570025959602;
        Wed, 02 Oct 2019 07:19:19 -0700 (PDT)
Received: from localhost ([132.205.230.8])
        by smtp.gmail.com with ESMTPSA id z8sm8878509qkf.37.2019.10.02.07.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:19:19 -0700 (PDT)
Message-ID: <5d94b1e7.1c69fb81.9393c.e57b@mx.google.com>
Date:   Wed, 02 Oct 2019 09:19:16 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: thermal: rcar-gen3-thermal: Add r8a774b1 support
References: <1569248589-52372-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569248589-52372-1-git-send-email-biju.das@bp.renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Biju Das <biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 23 Sep 2019 15:23:09 +0100, Biju Das wrote:
> Document RZ/G2N (R8A774B1) SoC bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

