Return-Path: <SRS0=voFw=X3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601B1C35280
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Oct 2019 14:19:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28925222C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Oct 2019 14:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570025966;
	bh=WFIOCLns4+pv4hFZ4ofshe2ehM8lhKIM0doElD2V7lo=;
	h=Date:From:Subject:References:In-Reply-To:Cc:Cc:To:List-ID:From;
	b=SPoBPD5alawEhtjFyh5TO8YvY3ROskgzOsiJUWeoEuW8PsOr9xZReEJj+ipwXqg9x
	 7CekLUCc9s6t07PSRRzI6/tppRu1PgYzKnaakfJSN3Gt3rTRV78i+wHxTl1eMxtMZB
	 FE/IfWB9cYim3FEWZiaauCJJYbMH4KWhacxPDur0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbfJBOTZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 2 Oct 2019 10:19:25 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:37278 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727370AbfJBOTY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 10:19:24 -0400
Received: by mail-qk1-f195.google.com with SMTP id u184so15159212qkd.4;
        Wed, 02 Oct 2019 07:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=85tR8H6eSQbp8hhXs9gANECEQV89PlE/4+pgO0zChjI=;
        b=U3QNmmXiDhTU5UQ1XccESPgA/Wg6hu0T0+s2OJl/E/3qlf3b2Ao/xEVpoen+NE0pGj
         kM4MrxUbE1EmAX0kCb96qTrdr4Qa+fe1f12dSCw+QLGenmNQ9MQJ8PZ1u/Nvjs1rcsSM
         g+De/ZeVpCpUbSOV8eiquHH7PGZrnamA03Ge9HD4BXIF+6l8MXZoug2Pc0iAjedJu6f1
         W99db1aV7AeEwtaYdBzv8ZPIB19EueWdQgLe1R6gdL8K0IKExaNUo+LclF3E7iJ5bJLD
         a3IoJjVlfbpKj8KfuipQbtl30swT57H6PZVXupjzfUKHYUh+Elm0acgGY7X+h0YjyYO5
         Ll3Q==
X-Gm-Message-State: APjAAAWIW499r5meGA7AkGbY1StFcZwFb7/YXx+wuxmsgYxb0Uqo7ttl
        q4RjEF4A4dJe9L8GQYpqGvUso2/SJg==
X-Google-Smtp-Source: APXvYqxl0vqPLIHcdw5JNrRMR3RixF+EmTDXGphMVpxF5iptToDqifoepo71fgpJ1HaArotIFXYvSg==
X-Received: by 2002:a37:a683:: with SMTP id p125mr3959622qke.173.1570025963727;
        Wed, 02 Oct 2019 07:19:23 -0700 (PDT)
Received: from localhost ([132.205.230.8])
        by smtp.gmail.com with ESMTPSA id f10sm9548652qtj.3.2019.10.02.07.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:19:21 -0700 (PDT)
Message-ID: <5d94b1e9.1c69fb81.65736.1b0d@mx.google.com>
Date:   Wed, 02 Oct 2019 09:19:18 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: timer: renesas: tmu: Document r8a774b1 bindings
References: <1569249052-1037-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569249052-1037-1-git-send-email-biju.das@bp.renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org,
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

On Mon, 23 Sep 2019 15:30:52 +0100, Biju Das wrote:
> Document RZ/G2N (R8A774B1) SoC in the Renesas TMU bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/timer/renesas,tmu.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

