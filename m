Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6ECC282C2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 18:07:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 61ED221872
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 18:07:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Uq7coi84"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbfAWSHA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 13:07:00 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34403 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfAWSHA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 13:07:00 -0500
Received: by mail-lf1-f68.google.com with SMTP id p6so2309295lfc.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jan 2019 10:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tMW/rm14xb79DCmcYm19k3/x2FCHZfu9JcDKY3Uuafk=;
        b=Uq7coi842otm8mAwFIhFQ4wHpQJsLAGYUls3oFQFOCGplGi7JuJ1wv4l4QUTXknJ5n
         okfH8iMUDonh2JSDbMvps38MJZDJizVvnTWwIuNPxuMxUfD6j1GGL4o53cFsm/zrEHue
         l5jBiemkvhv4WhByWsGBVO1TH8yJAAzugu8Yf287cvy7JGidupKRDEHTss+bM2ZmKiZ+
         PfWBmhV7VIq/sbJzR9vXeGTkci79f0aeyjpWcvT5Wh2VjkzTu5MUP3S7Hg6OVTlAd6xY
         ZhN6YmUA+qAsyBxeyiH6s0c3Z5nsL/4/zY5rt9mfPEbTegOShE0BfFF4r4PUyudF6Gem
         Y9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tMW/rm14xb79DCmcYm19k3/x2FCHZfu9JcDKY3Uuafk=;
        b=B+rHIijlInSpky5wxD3v3a0pw8KOlOlreYdWBpJ/UqBaoa/esg11XOHjJ0XgDkvzr4
         Du1wRkNVSQUYp/j3md6TydGfRA8sigf1FdWReg2iqZ5nE0a0pMShWpNOVeVPFJGryNOd
         fa4DOSYhsHJgkiI2g3+j/qF/Ga7G/XKAAfqmHWRuRm3URBdoN6Wd/8iNR3ySUogHcV9t
         0+R0g3TCICvhvtY3M0L7AYNqOiLbBFNPGIrd3jON+e0+YhnFYYNv5Mk0GMTJRKkmkdTY
         oLwOluPn8POHoWOr99AGbVBhKFbiyGEEUT0yZDKM7BS4EylYyIZ0aolsMyQJ2+moFr8a
         obWw==
X-Gm-Message-State: AJcUukfT3J5LnhyIoHesVj94pnQBgkh6YRNRhFtUdPTv6w75z3N0VZg5
        mfP7zDBIPu9Q5El+rN4e9hcyPA==
X-Google-Smtp-Source: ALg8bN7PaagyMTJabfEaVs0DuvsGkKAE8BTfY5QG4uT1l2UaLUHOlTde9fJSfjgJT0shfPYQ2Oggsg==
X-Received: by 2002:a19:7352:: with SMTP id o79mr2775275lfc.104.1548266818511;
        Wed, 23 Jan 2019 10:06:58 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.180])
        by smtp.gmail.com with ESMTPSA id 12-v6sm633546ljs.29.2019.01.23.10.06.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Jan 2019 10:06:57 -0800 (PST)
Subject: Re: [PATCH v7 2/2] dt-bindings: spi: Document Renesas R-Car Gen3
 RPC-IF controller bindings
To:     Mason Yang <masonccyang@mxic.com.tw>, broonie@kernel.org,
        marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, bbrezillon@kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        zhengxunli@mxic.com.tw
References: <1548227352-14910-1-git-send-email-masonccyang@mxic.com.tw>
 <1548227352-14910-3-git-send-email-masonccyang@mxic.com.tw>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <7a2bf711-f51e-82b0-b0c0-5d67f2c1d043@cogentembedded.com>
Date:   Wed, 23 Jan 2019 21:06:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1548227352-14910-3-git-send-email-masonccyang@mxic.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/23/2019 10:09 AM, Mason Yang wrote:

> Document the bindings used by the Renesas R-Car Gen3 RPC-IF controller.
> 
> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> ---
>  .../devicetree/bindings/spi/spi-renesas-rpc.txt    | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt b/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
> new file mode 100644
> index 0000000..305bd10
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
> @@ -0,0 +1,46 @@
> +Renesas R-Car Gen3 RPC-IF controller Device Tree Bindings
> +--------------------------------------------------------------------
> +
> +Required properties:
> +- compatible: should be an SoC-specific compatible value, followed by
> +		"renesas,rcar-gen3-rpc" as a fallback, i.e.,
> +		"renesas,r8a77995-rpc", "renesas,rcar-gen3-rpc".
> +		"renesas,r8a7795-rpc"	(R-Car H3)
> +		"renesas,r8a7796-rpc"	(R-Car M3-W)
> +		"renesas,r8a77965-rpc"	(R-Car M3-N)
> +		"renesas,r8a77970-rpc"	(R-Car V3M)
> +		"renesas,r8a77980-rpc"	(R-Car V3H)
> +		"renesas,r8a77990-rpc"	(R-Car E3)
> +		"renesas,r8a77995-rpc"	(R-Car D3)
> +- reg: should contain three register areas:

   The driver now handles "dirmap" and "wbuf" resources as optional --
you need to document that.

[...]

MBR, Sergei
