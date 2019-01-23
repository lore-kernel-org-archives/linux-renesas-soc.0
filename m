Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6935CC282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 15:15:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2216B217D4
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548256520;
	bh=EmlVQaMHuy8OFIwKuLPDJSesIGQ04rSrDPxrtbaY0SE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=xKXVciIqBJTBXFgo0oIVqqILPOeNUFIzQonwHO0leSvkiRDXRkgXiMNboItOob6O4
	 AT7wX88s4a4Qo+Yg/MKJTQZszaxAnN6HPaviDV0i0MreFlsKsgvH7lV/vaCOf8xVjA
	 sbYnY+/9/3nvAIT0MD04ORIzBCwKUTaTGFJLlFiA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfAWPPT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 10:15:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:41752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725871AbfAWPPT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 10:15:19 -0500
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2203217D4;
        Wed, 23 Jan 2019 15:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548256519;
        bh=EmlVQaMHuy8OFIwKuLPDJSesIGQ04rSrDPxrtbaY0SE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ktSIjLcv9IsuMK4r7BEHMVErx5+0CtAHi5pVLq8bBq6CYXw8Nx9ZHpmMoCUm/Tr0y
         rYIy/2uoALJebyh+Ape4/rd1YiT6aeiOKNIjXJa/mUOkHZLd0Gr+5b4e8KSSW0clRA
         ZlL+pNtbxgDXSgcbgGzZqeK0g1zCaxMCg0g2Iha8=
Received: by mail-qk1-f175.google.com with SMTP id o125so1286710qkf.3;
        Wed, 23 Jan 2019 07:15:18 -0800 (PST)
X-Gm-Message-State: AJcUukd2CbS6pQ6YtOkxvHJMPFVhlNOTraP92NJUxBwYmCl/CQPhY6YO
        27XYD7YCA9K4cUkcSJZ2B/tPPlfy2AuPXBuU2g==
X-Google-Smtp-Source: ALg8bN5yoPVVoSbH1JkZJXc3UaD0pRV/rFIrLnM6dT+c6JXirF08cBHXvtO1euHVEyLKzR2sEMxJNo4sm/6RfGWxpf4=
X-Received: by 2002:a37:5686:: with SMTP id k128mr1976636qkb.29.1548256518052;
 Wed, 23 Jan 2019 07:15:18 -0800 (PST)
MIME-Version: 1.0
References: <20190123134833.119031-1-chris.brandt@renesas.com>
 <CAL_JsqKuDzL2N_fihJzUEZ9uRK5HWd1ARD7DzZZM7Dy4C8M_BA@mail.gmail.com> <TYXPR01MB1568588CC80BDB074A4FADA08A990@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB1568588CC80BDB074A4FADA08A990@TYXPR01MB1568.jpnprd01.prod.outlook.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 23 Jan 2019 09:15:06 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLz-w+jZD3ybcjRhLBKsnrsEqxkPyaSy015LiL_1_hmpw@mail.gmail.com>
Message-ID: <CAL_JsqLz-w+jZD3ybcjRhLBKsnrsEqxkPyaSy015LiL_1_hmpw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: renesas: Document RZ/A2M EVB
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 23, 2019 at 8:09 AM Chris Brandt <Chris.Brandt@renesas.com> wrote:
>
> On Wednesday, January 23, 2019, Rob Herring wrote:
> > Please check your changes with 'dt_binding_check' target. This will
> > fail. 'description' already has a value, so you can't add a list to
> > it. And description has to be a string.
> >
> > >          items:
> >
> > Move the 2 lines here.
> >
> > >            - const: renesas,r7s9210
>
> I can't find 'dt_binding_check' (I guess it's only in the DT tree).

It's a make target added in 5.0-rc1. You need 'yaml-bindings'
installed. See Documentation/devicetree/writing-schemas.md for
details.

Rob
