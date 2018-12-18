Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35695C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 15:44:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ED86D218A2
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545147877;
	bh=V/QLeexUBf7LMNqRZ8rUJqD9eC0ComCOKuNjv8Ji4h0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=Cn7DRm3F1V63X7VhPWM4+68GC11F3cnAZtnK3p5m6BZL8e6fghBNIVEtT5Vn3neys
	 SUOo2dJbkS9TBD1a8VClQQLKAu8in8VoZBe+ZNYFO+RQ40Ub07M81RdiAPjgMU5EAf
	 1HLIOO/gUlmPBDWwnEHKTzHTFeiVzIOM0sQaQE/Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbeLRPog (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 10:44:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:32778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726738AbeLRPog (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 10:44:36 -0500
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C257C218A2;
        Tue, 18 Dec 2018 15:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545147875;
        bh=V/QLeexUBf7LMNqRZ8rUJqD9eC0ComCOKuNjv8Ji4h0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=new6lN1FKUP8TPNIkNdQiyKDkRJ4MjTcnQGyry4sg6u1tHnXX0nbMXyDm+I1Zq3x2
         Volrc5UyRZqMBlUgyvn7G9+Y3EB8Ru/XAGzy0MF+R7NujPRTRGOd5jSpu7cL9zFjp+
         QDka6rrnH29uaxS2QqUefQme3M159OJKBayGD1p4=
Received: by mail-qt1-f170.google.com with SMTP id n32so18602335qte.11;
        Tue, 18 Dec 2018 07:44:35 -0800 (PST)
X-Gm-Message-State: AA+aEWbhSWilUfzSo/QWSLEzUMu8XM4X3GiWa8LJ4bpv+WO8PTdaJQSq
        fFDtKBLTxavkzGpfcInAdad1TQcSHol+vdALyA==
X-Google-Smtp-Source: AFSGD/Vp+3vA7cUqshNpML9Uu0/rBv7+/uTQWyBDbaOZAi0O6I7KdElMFuHQ+cXvr102spuktNEWBk3u3n5xZArHtcs=
X-Received: by 2002:a0c:8c8a:: with SMTP id p10mr17741896qvb.218.1545147875009;
 Tue, 18 Dec 2018 07:44:35 -0800 (PST)
MIME-Version: 1.0
References: <20181217144324.99422-1-chris.brandt@renesas.com>
 <20181217144324.99422-2-chris.brandt@renesas.com> <20181218150551.GA15519@bogus>
 <TYXPR01MB1568D8FDF5E286B2832703048ABD0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
In-Reply-To: <TYXPR01MB1568D8FDF5E286B2832703048ABD0@TYXPR01MB1568.jpnprd01.prod.outlook.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 18 Dec 2018 09:44:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLcnWLK0Uyg1YQ7TRzN+vMqtKNO6Jj+VLb_dTzstTDj-Q@mail.gmail.com>
Message-ID: <CAL_JsqLcnWLK0Uyg1YQ7TRzN+vMqtKNO6Jj+VLb_dTzstTDj-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ARM: dts: r7s9210: Initial SoC device tree
To:     Chris Brandt <Chris.Brandt@renesas.com>
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

On Tue, Dec 18, 2018 at 9:40 AM Chris Brandt <Chris.Brandt@renesas.com> wrote:
>
> On Tuesday, December 18, 2018 1, Rob Herring wrote:
> > > +/ {
> > > +   compatible = "renesas,r7s9210";
> > > +   interrupt-parent = <&gic>;
> > > +   #address-cells = <1>;
> > > +   #size-cells = <1>;
> > > +
> > > +   bsid: chipid@fcfe8004 {
> >
> > Put all the mmio peripherals under a simple-bus node or nodes.
>
> Just to be clear on what you mean, basically put all the peripherals
> under a 'soc' node like the other Renesas parts?

Yes.

>
>         soc {
>                 compatible = "simple-bus";
>                 interrupt-parent = <&gic>;
>
>                 #address-cells = <2>;
>                 #size-cells = <2>;
>                 ranges;
>
>
> Thanks,
> Chris
>
