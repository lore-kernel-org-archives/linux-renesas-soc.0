Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A15C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 13:59:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07ECC2184D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 13:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548251981;
	bh=WGg43VUk47K1k7pVuahlbfjdng28zh6Usosa9mlyi5Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=arAkMNNTb3Mxkq6GQRF/1zwNnfNojWepz7FrrLBgfgCJJzOhg6aR7g5QlZV2WJa5s
	 oxqhG+yfcBC9YUhQldJVjld9B5XoeTlllhti0FTXMCiah3k2uRYAfySBA3T21kfUGZ
	 VZTeRANxud/PtTT2TFATArAe4ViEVMKY73qtCpFI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfAWN7k (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 08:59:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:36860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbfAWN7k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 08:59:40 -0500
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E33D2184D;
        Wed, 23 Jan 2019 13:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548251979;
        bh=WGg43VUk47K1k7pVuahlbfjdng28zh6Usosa9mlyi5Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XawkPV7Ff5085Z44zKC79CV1mvyAZ0a24LybAVVcluj8SNoYT5q4lpu2R74pOU6gq
         YLdkZvJYbeUOHAgyduMS2rbDDYnsXUqqSoKsYJXzOg4K0rxbbUvNmwysPDGw7T7wYY
         Bzmh4RFd4IUVnCgQpCimqh504GWfnVUCCTtMd9uU=
Received: by mail-qk1-f173.google.com with SMTP id d15so1157519qkj.0;
        Wed, 23 Jan 2019 05:59:39 -0800 (PST)
X-Gm-Message-State: AJcUukfT0dGk43a74i2M5bD6adNkJeTJaFbXiIc/omyh9Fa3er4AHmU/
        v1VBrV36spPuygYrhvec6EOVczmOWIyG/eNjLQ==
X-Google-Smtp-Source: ALg8bN5pflswQvIQfT5Zybno0GiRE4aRsMXzDB2D2yIRg3iUZWDXO2Q4tYG4Bh6OtlXaQMyfmDoCElc45l4AkB3y8+U=
X-Received: by 2002:ae9:ef14:: with SMTP id d20mr1870908qkg.147.1548251978722;
 Wed, 23 Jan 2019 05:59:38 -0800 (PST)
MIME-Version: 1.0
References: <20190123134833.119031-1-chris.brandt@renesas.com>
In-Reply-To: <20190123134833.119031-1-chris.brandt@renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 23 Jan 2019 07:59:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKuDzL2N_fihJzUEZ9uRK5HWd1ARD7DzZZM7Dy4C8M_BA@mail.gmail.com>
Message-ID: <CAL_JsqKuDzL2N_fihJzUEZ9uRK5HWd1ARD7DzZZM7Dy4C8M_BA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: renesas: Document RZ/A2M EVB
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 23, 2019 at 7:48 AM Chris Brandt <chris.brandt@renesas.com> wrote:
>
> Add the RZ/A2M Evaluation board.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> index 5e9d4864a600..474eb2647829 100644
> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -29,6 +29,8 @@ properties:
>            - const: renesas,r7s72100
>
>        - description: RZ/A2 (R7S9210)
> +          - enum:
> +              - renesas,rza2mevb # RZ/A2M Eval Board (RTK7921053S00000BE)

Please check your changes with 'dt_binding_check' target. This will
fail. 'description' already has a value, so you can't add a list to
it. And description has to be a string.

>          items:

Move the 2 lines here.

>            - const: renesas,r7s9210
>
> --
> 2.16.1
>
