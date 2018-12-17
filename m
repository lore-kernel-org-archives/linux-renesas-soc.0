Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A98C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 12:58:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 81E3320656
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 12:58:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBSkUXJP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbeLQM6P (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 07:58:15 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35017 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbeLQM6O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 07:58:14 -0500
Received: by mail-ot1-f66.google.com with SMTP id 81so12034291otj.2;
        Mon, 17 Dec 2018 04:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m0Vs1ma/WG4VKSqRjE6so+m8oP9GVLdfRaL1Unqa8nI=;
        b=qBSkUXJPEVT48sa1yO0yZsh668xQFANhD1ih4CtSDXEo1QK+XQLbN5uKLwGDOAVWjy
         /epPUuZww7i/69xvz2SDgLyTGOH4ZjPjrb/tdq24+tXrOCA+WwsyHTUwY8Ct0EY4P6aX
         dL5dvJX5yMfInCGT2lVeOY5nqXbUVa2x9E9mwuWMx95wf3T3q+xu2n3h0heceiiqQxt9
         Lv861qVklZEBr7514aGTm91HHNObt1JvQkOwV8aAZ3UU5Csvjc1/EeDE5K1TPA4BNsOO
         IDWXRawcP42A6tyuA7K/Fl9dn7eMFfBEns/VXe8oMMRw3XRsfXrTs4VbRDlX/FIx3ETi
         eNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m0Vs1ma/WG4VKSqRjE6so+m8oP9GVLdfRaL1Unqa8nI=;
        b=U6MRLjWRTKjZbJsyc2cFYSkunhMNhTUeDHPvLwLQPqybWd1rUkhwpSE9TuLqjBXA7O
         UfO/IRZBL0K7JCgW2M6qDMlhwjmp3/8C7YogJKmesWp0EoSQEypgGadWDNZt9uxVCxnw
         OJnEFLHHRXSiU6sxTU8Rx10FIw0CrGGRSDF5NllFWAe5wDp2JOuayehpecvsLpQzTrK/
         vZGTRtg6+2VjtZNALv57HT4HPtG/54ewaoEjOuqxCzLicwx7jJPfGxaEZQzLFGry67Is
         yUt5eCyr1Ii08bRfSvGgNtc3w1QdkqYnhsQrIpLiBG3MqnlOTYWgpT945TRO1GrUuHOn
         1msg==
X-Gm-Message-State: AA+aEWZGKO5t3jDV2Sz3vcz0H2yfUUSg2wn/levYKr/JVO9NDS7BQnHU
        CylhWhlu2uTbMUXSJVXwYE97AFZqc/SHp1NDYTI=
X-Google-Smtp-Source: AFSGD/XLzDQJiNPqJ2Vp8ULmy49MUyeRHEmUpmgGY7mB7ghhleTV4XCYtww5AujkG7KNI9+SZ5QiDVU45YByTxRa8vg=
X-Received: by 2002:a9d:6419:: with SMTP id h25mr10069216otl.34.1545051493215;
 Mon, 17 Dec 2018 04:58:13 -0800 (PST)
MIME-Version: 1.0
References: <1539612719-9650-1-git-send-email-ykaneko0929@gmail.com> <20181205061221.GA21626@localhost.localdomain>
In-Reply-To: <20181205061221.GA21626@localhost.localdomain>
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date:   Mon, 17 Dec 2018 21:58:02 +0900
Message-ID: <CAH1o70+BgK62TZPRd9zdwyF58MSyewm_qOmFYcZFN0_Ui4NFuQ@mail.gmail.com>
Subject: Re: [PATCH/RFT 0/2] thermal: add suport for R8A77990
To:     Eduardo Valentin <edubezval@gmail.com>
Cc:     Linux PM list <linux-pm@vger.kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Eduardo,

I am sorry for my late replay.

2018=E5=B9=B412=E6=9C=885=E6=97=A5(=E6=B0=B4) 15:12 Eduardo Valentin <edube=
zval@gmail.com>:
>
> Hello Yoshihiro,
>
> On Mon, Oct 15, 2018 at 11:11:57PM +0900, Yoshihiro Kaneko wrote:
> > This series adds thermal support for R-Car E3 (R8A77990).
> >
> > This series is based on the next branch of Eduardo Valentin's linux-soc=
-thermal
> > tree.
>
> Sorry for the late response, but would you be able to refresh your
> series to latest linus master branch?

Yes, I will do it.

Best regards,
Kaneko

>
> >
> > Yoshihiro Kaneko (2):
> >   dt-bindings: thermal: rcar-thermal: add R8A77990 support
> >   thermal: rcar_thermal: add R8A77990 support
> >
> >  Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 5 +++--
> >  drivers/thermal/rcar_thermal.c                             | 4 ++++
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >
> > --
> > 1.9.1
> >
