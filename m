Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33455C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 17:26:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F272C2184C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 17:26:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rGwnshR8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728994AbfAXR0P (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 12:26:15 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38239 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728610AbfAXR0P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 12:26:15 -0500
Received: by mail-oi1-f196.google.com with SMTP id a77so5487497oii.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Jan 2019 09:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0unjHn1gxYMx6t77T8Kb8YoPBspCVOmZM2J/r/G0Vgk=;
        b=rGwnshR84SayAzgZplI4HFzIkaZERW/nt0lbD09FhDz6NMF8zUa8BRWBlxgu9DR8b0
         S0RBxYG8goaSGn6WBRAHQ8JttB4MaCv0cyelt2Q3YJrB2dLFrwnIQlbRGIwcjizogZZq
         0BVZv65McTyRbghLfwZxykRjmhe+J7n9DDMcjvMQtisNW5s3o+tMNTI802uOiPNOxYr3
         yqrN5j03HWri1mgL8xkUvtFq88GzcbuHTgVBwB0Rxkckw7IfHrxAbsfHdea9fZ/uaAAk
         /C2L8Qbr2E5tQW3aAYW6VDgkzw5+3DOENz9ORamLr9+xITzBQ+0NS+g0/o/GQXbNs2Gp
         ExBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0unjHn1gxYMx6t77T8Kb8YoPBspCVOmZM2J/r/G0Vgk=;
        b=E8qq99dsarM8yIwNTcM0aa1Am4PRlY9paNrpp3dE9KVPFGEC0mRmbk++bIFckUE82b
         Oj5Mz8g5iyyqZjw7dsqfO+4z/OOIx5PjF5XU8FCsg91Ju+JBfbLT5DWjvu96182O/LMP
         LZQz+ML/dyVPnBzqJ4jEGcSxLBZ3E1/UxJ034o09kWYTMczklZKeI0FP6EwJBPYsyvPJ
         CQFmBM9bNO+z+8BVyEiKOkVsA8K896L+6qAaPVmHwa5sZ6Q4d6BMjITDCiyZtwJYYO80
         6tM4rhGMO0JIUULCFFIsHe6qHeMG5WdRqgmXHbOqQ5gRxO6Lj9LAmWFf6WI5z62joklp
         bYJw==
X-Gm-Message-State: AJcUukfgQe4CZNU4amwMrkbvSO+f37hB/+1IZU8/Mfs57ihAxrg3fb7L
        fXNO8wP3Lk35wu83RCndwmFTJZtloOkBfit6yxg=
X-Google-Smtp-Source: ALg8bN4GIaIgmY1Gf1jelRaATQZZXQ6HE+SjI/tonO8ZiPCDnvRWn+GzV0lm323BPurmOf4IYfTm6z3VVJsQneovhmk=
X-Received: by 2002:aca:b4c5:: with SMTP id d188mr1740600oif.309.1548350774289;
 Thu, 24 Jan 2019 09:26:14 -0800 (PST)
MIME-Version: 1.0
References: <1547553668-4359-1-git-send-email-ykaneko0929@gmail.com> <CAMuHMdVcXjeOGr-Xtvhyi5G2d7Y4Gi-raBPK+Qja02-KxBE0wQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVcXjeOGr-Xtvhyi5G2d7Y4Gi-raBPK+Qja02-KxBE0wQ@mail.gmail.com>
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date:   Fri, 25 Jan 2019 02:26:03 +0900
Message-ID: <CAH1o70JnSx_X+e4fridbAd31bDjLbOhvF7diK39qckFcSLTO4Q@mail.gmail.com>
Subject: Re: [PATCH/RFT] pinctrl: sh-pfc: r8a77990: Add DRIF pins, groups and functions
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

Thanks for your review!

2019=E5=B9=B41=E6=9C=8817=E6=97=A5(=E6=9C=A8) 1:38 Geert Uytterhoeven <geer=
t@linux-m68k.org>:
>
> Hi Kaneko-san,
>
> On Tue, Jan 15, 2019 at 1:01 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> =
wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > This patch adds DRIF{0,1,2,3} pins, groups and functions to the R8A7799=
0
> > SoC.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
>
> Thanks for your patch!
>
> > --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> > +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
>
> > @@ -3523,7 +3716,7 @@ enum {
> >  };
> >
> >  static const struct {
> > -       struct sh_pfc_pin_group common[241];
> > +       struct sh_pfc_pin_group common[262];
> >         struct sh_pfc_pin_group automotive[2];
> >  } pinmux_groups =3D {
> >         .common =3D {
> > @@ -3555,6 +3748,27 @@ enum {
> >                 SH_PFC_PIN_GROUP(can0_data),
> >                 SH_PFC_PIN_GROUP(can1_data),
> >                 SH_PFC_PIN_GROUP(can_clk),
> > +               SH_PFC_PIN_GROUP(drif0_ctrl_a),
> > +               SH_PFC_PIN_GROUP(drif0_data0_a),
> > +               SH_PFC_PIN_GROUP(drif0_data1_a),
> > +               SH_PFC_PIN_GROUP(drif0_ctrl_b),
> > +               SH_PFC_PIN_GROUP(drif0_data0_b),
> > +               SH_PFC_PIN_GROUP(drif0_data1_b),
> > +               SH_PFC_PIN_GROUP(drif1_ctrl),
> > +               SH_PFC_PIN_GROUP(drif1_data0),
> > +               SH_PFC_PIN_GROUP(drif1_data1),
> > +               SH_PFC_PIN_GROUP(drif2_ctrl_a),
> > +               SH_PFC_PIN_GROUP(drif2_data0_a),
> > +               SH_PFC_PIN_GROUP(drif2_data1_a),
> > +               SH_PFC_PIN_GROUP(drif2_ctrl_b),
> > +               SH_PFC_PIN_GROUP(drif2_data0_b),
> > +               SH_PFC_PIN_GROUP(drif2_data1_b),
> > +               SH_PFC_PIN_GROUP(drif3_ctrl_a),
> > +               SH_PFC_PIN_GROUP(drif3_data0_a),
> > +               SH_PFC_PIN_GROUP(drif3_data1_a),
> > +               SH_PFC_PIN_GROUP(drif3_ctrl_b),
> > +               SH_PFC_PIN_GROUP(drif3_data0_b),
> > +               SH_PFC_PIN_GROUP(drif3_data1_b),
>
> As RZ/G2E (r8a774c0) does not have the DRIF modules, the DRIF pin groups
> should be added to the automotive section, instead of the common section.

I will do that.

>
> >                 SH_PFC_PIN_GROUP(du_rgb666),
> >                 SH_PFC_PIN_GROUP(du_rgb888),
> >                 SH_PFC_PIN_GROUP(du_clk_in_0),
>
> > @@ -4157,7 +4404,7 @@ enum {
> >  };
> >
> >  static const struct {
> > -       struct sh_pfc_function common[44];
> > +       struct sh_pfc_function common[48];
> >         struct sh_pfc_function automotive[2];
> >  } pinmux_functions =3D {
> >         .common =3D {
> > @@ -4166,6 +4413,10 @@ enum {
> >                 SH_PFC_FUNCTION(can0),
> >                 SH_PFC_FUNCTION(can1),
> >                 SH_PFC_FUNCTION(can_clk),
> > +               SH_PFC_FUNCTION(drif0),
> > +               SH_PFC_FUNCTION(drif1),
> > +               SH_PFC_FUNCTION(drif2),
> > +               SH_PFC_FUNCTION(drif3),
>
> Likewise for the DRIF pin functions.

Likewise.

>
> >                 SH_PFC_FUNCTION(du),
> >                 SH_PFC_FUNCTION(hscif0),
> >                 SH_PFC_FUNCTION(hscif1),
>
> The rest looks good to me, so with the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

Best regards,
Kaneko
