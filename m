Return-Path: <SRS0=AhbF=PM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75DDC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 09:17:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99745217F5
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  4 Jan 2019 09:17:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbfADJR2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 4 Jan 2019 04:17:28 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:33448 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfADJR2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jan 2019 04:17:28 -0500
Received: by mail-vs1-f65.google.com with SMTP id p74so22336658vsc.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jan 2019 01:17:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vnaQvff+1MMNvxAriP2cdEUPk+alErVVISPfkgY60B8=;
        b=ZEfuD1mXNZhvsrjPq3UdI0EAGkSppH5MfMDSlkftVEO3uCezZsAADIY3FO8VMb73pL
         L6XqxqF+lRAynDPqTj1T1j1CPy/zanwabmNTJSIPgNwdv34HpNyQSvTwEmgzVr8e8aZb
         08i6G/rfZYj1YHSHW50SZX4gCHg7oO3hAjX5Lig0saDPv7ckH6o7DcsWUHb0OPeY85rm
         ufPe2NRH3y37anZT2icZ8LGm6//T9Thys+uqVdNHCIMHfV9lJE6QfiJsYtjpRShA24px
         5Mo27owZtS2NjDD428P051GvWiTWp8lWN5t85PauSZ44zKYXpk6zMOG2fwJOyiNDjYK+
         7TuA==
X-Gm-Message-State: AA+aEWaRIskRLFtlzGVCI+jmbXkOScG4XzNYRfExqZ3+OBfpodIpbylm
        1vk/sDD5YaI8teOku5ifFvi+0jFESfrBdqcRlWI=
X-Google-Smtp-Source: AFSGD/Un1yptL8aHgggs9K9IytFP1DH93NL2tkwBRhX+1rqy/WAy08s9BZthWFCXiiYC0YbGYN4LdXXb0ywqO0pf93g=
X-Received: by 2002:a67:b60d:: with SMTP id d13mr21139120vsm.152.1546593446696;
 Fri, 04 Jan 2019 01:17:26 -0800 (PST)
MIME-Version: 1.0
References: <20190102095154.25839-1-horms+renesas@verge.net.au>
 <CAMuHMdU=aR8mSwd876LV=DG_vh6Bx45zxRTfMXuX3BQpy0M=ow@mail.gmail.com>
 <20190104085720.36ccxhtcbyyzgfrk@verge.net.au> <CAMuHMdWf=_-WZT9XUqPCZocNs1As3RJnXMYRYc05Y4td6SciFg@mail.gmail.com>
 <20190104091216.dgbnkxuuamgicysg@verge.net.au>
In-Reply-To: <20190104091216.dgbnkxuuamgicysg@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Jan 2019 10:17:15 +0100
Message-ID: <CAMuHMdWhCf-DSvVw7Z-uNpCJZ_kdGzf297OSFLZzc5TZvTNS3A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable R-Car thermal driver
To:     Simon Horman <horms@verge.net.au>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Fri, Jan 4, 2019 at 10:12 AM Simon Horman <horms@verge.net.au> wrote:
> On Fri, Jan 04, 2019 at 10:01:13AM +0100, Geert Uytterhoeven wrote:
> > On Fri, Jan 4, 2019 at 9:57 AM Simon Horman <horms@verge.net.au> wrote:
> > > On Wed, Jan 02, 2019 at 11:45:37AM +0100, Geert Uytterhoeven wrote:
> > > > On Wed, Jan 2, 2019 at 10:53 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> > > > > Enable the R-Car thermal driver as a built-in.
> > > > >
> > > > > This driver is used in conjunction with the R-Car V3M (r8a77970),
> > > > > E3 (r8a77990) and D3 (r8a77995) SoCs.
> > > >
> > > > > [v2] Enable as a built-in rather than a module as this seems
> > > > >      safer from the point of view of protecting equipment from
> > > > >      overheating.
> > > >
> > > > Shouldn't the above paragraph be moved below the ---?
> > >
> > > I have recently come to believe that its a matter of taste. And I think in
> > > this case it captures important information that is worthy of inclusion in
> > > the changelog.
> >
> > The rationale behind doing it this way could still be appended to the
> > first line of the body of the patch decription.
>
> Sorry, I'm having a little trouble parsing that. Do you mean that it could
> be appended to the body of the changelog at apply-time?

I mean the rationale could have been part of the patch description, i.e.
above the ---, e.g.:

    Subject: [PATCH v2] arm64: defconfig: Enable R-Car thermal driver

    Enable the R-Car thermal driver as a built-in.
    Built-in seems safer than modular from the point of view of protecting
    equipment from overheating.

    This driver is used in conjunction with the R-Car V3M (r8a77970),
    E3 (r8a77990) and D3 (r8a77995) SoCs.

    Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
    ---
    v2:
      - Switch from built-in to modular.

     arch/arm64/configs/defconfig | 1 +
     1 file changed, 1 insertion(+)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
