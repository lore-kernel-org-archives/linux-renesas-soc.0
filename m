Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0958C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 13:42:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98CC9218AF
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548337323;
	bh=YddJh2Iof/6II369Iui9LX2FVK6ZkQpGl2j25Wp0Dtc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=RgpEmoxOW8l9wMi5qQr2KfkqqnlFIuafJsSx6Kqn5jaBk/fX2k79fc9n29m16Kk6x
	 MsW1U8SdB/E7C6uWSQhvYGRnbeGR2lr/95vE2e9EaLUZa/qCBpU97lcpwH3VdjaDDw
	 4eGxinDvAfm8B71vV7y6g1ihIpkcGhsnWSqlHekY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbfAXNmD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 08:42:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:55726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728031AbfAXNmD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 08:42:03 -0500
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85B61218AF;
        Thu, 24 Jan 2019 13:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548337322;
        bh=YddJh2Iof/6II369Iui9LX2FVK6ZkQpGl2j25Wp0Dtc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ESDHdjR30IOzk1mYys28RNswfRKCRzFA8NyU3ClQGwm4HuNiodMY2/cK8KMCM0PUR
         M3onA95QJ7I8ATFt7jndrpxQJRfzUeH3lVlgfRkI4JaXZXApvsSXdW+YyV0c+uhSmh
         Zy2554tSZjedtObum8AWyK51O8g6n7Cd791R/hM0=
Received: by mail-qk1-f179.google.com with SMTP id o125so3211282qkf.3;
        Thu, 24 Jan 2019 05:42:02 -0800 (PST)
X-Gm-Message-State: AJcUukf801fqkbLlWwFSX36ucQCOFO+zfiHttY4ZjNYpvlZ20jn3n6Fu
        StgL/eWLmx7emmG3O8pcBZlixO54xQb93JDmQg==
X-Google-Smtp-Source: ALg8bN4rU+KcU4HNNTVzmaLOpr0PhgVbcFVx+Huw0ZwsJ96R2KhxoxR/Wq2RnUmQ0v+/69McT4wov6H2aggCSJCTJeU=
X-Received: by 2002:a37:5686:: with SMTP id k128mr5382394qkb.29.1548337321714;
 Thu, 24 Jan 2019 05:42:01 -0800 (PST)
MIME-Version: 1.0
References: <20190123143012.119912-1-chris.brandt@renesas.com>
In-Reply-To: <20190123143012.119912-1-chris.brandt@renesas.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 24 Jan 2019 07:41:50 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLQGptKCan7GoNGFfJORyECuF2BxXzJWOe2VSdgUzjYWw@mail.gmail.com>
Message-ID: <CAL_JsqLQGptKCan7GoNGFfJORyECuF2BxXzJWOe2VSdgUzjYWw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm: renesas: Document RZ/A2M EVB
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

On Wed, Jan 23, 2019 at 8:30 AM Chris Brandt <chris.brandt@renesas.com> wrote:
>
> Add the RZ/A2M Evaluation board.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * 'enum' is supposed to go under 'items'
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
