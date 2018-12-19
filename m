Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 266A5C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 14:03:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8541218A6
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 14:03:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI0bsHzo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbeLSODg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 09:03:36 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:35863 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbeLSODg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 09:03:36 -0500
Received: by mail-ot1-f51.google.com with SMTP id k98so19193896otk.3;
        Wed, 19 Dec 2018 06:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Chqqq1EarQFn9/JgXLfQBe8z6vwdsODJlVOP5/qHk+k=;
        b=OI0bsHzo8MJBGQ8JEE4A148S4wbIRrhJhmOAoqmTENEbV8E1DkOfDTysKDTyErXA0I
         XNLIQprvgoTgJpzGDvITFMwPPFhl9tM94ullhGXMdAsujN9Uxr/ddXSYUVPJjWfV/jzB
         /oN98LpnhXOoV/wgEid6IlEh4hMVKiNCavMYBYfSRqBkuDx4lp8U2OmSkWgtyb3qTw36
         8Lv78cSjntGLXVXMEl6TQEDPEzClIQD8CAsvInZv1oL8qHg9GVNejzXUXwctiZIfqWuQ
         WTJJPgC3hI6CxFduNu5Rp8DVMlMTuzB4XiHkg2d3yRTgnYgyrbPcaOA4ftYetwqlH36j
         bkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Chqqq1EarQFn9/JgXLfQBe8z6vwdsODJlVOP5/qHk+k=;
        b=kwDzW/hP0WVt2wzLGkkVNWTk6F0Vs4Xt/J8Zl03ztV4ScNAMjCxkr70ZTAc8lrz8dE
         TtLWriWvlPdAdZz5SN24GK7Ezf9FXEqjE3Z0sb85rDd0qq82TKvqFBrXs1apgtdS4l08
         Y+HI3liapeWcgxyEb+Ld9oLC17PsLihTcOYISM8YknQjdf87JA/QQbPGP3qLiQjMa5bE
         vru5+G3VpVSzL9nz5Xd6vPjj01OV/f9P966ZAV4jviC30ptxfctv0yivm0gjozLUOaPx
         1cIi8SxGdI7i+VCANOwuFZzJJNTcpx258P7Zx4ft1xJRK86WJUS8EzGBj2TT+MAbL8Px
         jTMQ==
X-Gm-Message-State: AA+aEWbVuDci2LRFMSgBu7rs3TrQFYzbT1JsFCJkBuLFU/2og3lXKdMi
        C7OPoI2JhJxWYNb0u0znev90lrBExQjUVjxxkpw=
X-Google-Smtp-Source: AFSGD/V1A/4EojgwUf6ScF1RfTInzLezKyXxqwCq5QsLs5k8na326i30wuqwcFf2nE++AenoPNtpHW5TP0z42JslP30=
X-Received: by 2002:a9d:640d:: with SMTP id h13mr15475627otl.153.1545228214968;
 Wed, 19 Dec 2018 06:03:34 -0800 (PST)
MIME-Version: 1.0
References: <1545058221-22529-1-git-send-email-ykaneko0929@gmail.com>
 <1545058221-22529-2-git-send-email-ykaneko0929@gmail.com> <20181217204944.GA19990@bogus>
In-Reply-To: <20181217204944.GA19990@bogus>
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date:   Wed, 19 Dec 2018 23:03:23 +0900
Message-ID: <CAH1o70KfDb8g=Pe19r0KkfWErdyt_5sT=7XoM94CCJtvPJkJ9Q@mail.gmail.com>
Subject: Re: [PATCH/RFT v2 1/2] dt-bindings: thermal: rcar-thermal: add
 R8A77990 support
To:     Rob Herring <robh@kernel.org>
Cc:     Linux PM list <linux-pm@vger.kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
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

2018=E5=B9=B412=E6=9C=8818=E6=97=A5(=E7=81=AB) 5:49 Rob Herring <robh@kerne=
l.org>:
>
> On Mon, Dec 17, 2018 at 11:50:20PM +0900, Yoshihiro Kaneko wrote:
> > Document the R-Car E3 (R8A77990) SoC bindings.
> >
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
>
> Please add acks/reviewed-bys when posting new versions.

Sorry. I will do that from next time.
