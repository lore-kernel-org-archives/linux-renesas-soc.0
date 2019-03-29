Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803BCC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 09:56:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5995920811
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 09:56:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728846AbfC2J42 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 05:56:28 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:37282 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728398AbfC2J41 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 05:56:27 -0400
Received: by mail-ua1-f66.google.com with SMTP id l17so314180uar.4;
        Fri, 29 Mar 2019 02:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qfsfnrskb99l2ZQG9KyytfL+vmZpQlcNfQSmX7gCAQg=;
        b=UMfUqF2A5aWNgMnWPQTdvSnLpkXXAFIHIw7ZKp9tFbfMvg7ADV+Vp+9kRFjc1dVk2l
         XBZPLCerflT2lFVuN45fRsYm5hSkuxHHbCEJhcnHcJ2XFuOzDIYF4lQxwPiJq4KIwoc9
         zs1d+ogcr3As5Sam8mSznPQhPE2fXBux6b6/6I9iC57f9Tq1blLGzDaj0nPmK7oR01NH
         8YxRaw+1xsnQgsdpwJiHHCMF7imStzbq/vTbwIrkpJT4rs610xRI3to9PUgKmvLDc4dK
         8d/cOiUaJmLwkZ3AfJGGztBB39Vq0IJD5CmnzyKl2v3Boh+5iqTEUHy37PcCzCazeH9K
         0Qwg==
X-Gm-Message-State: APjAAAW9gmHu0GsNH4PoRi0v6+3rc+OSKuyn3DnjNPRfrTVn55S7YhTh
        EQJE80AgIqYs7uZpyhQ0ggNpVgYDgTE/VF37edA=
X-Google-Smtp-Source: APXvYqwixeHQhT7JAXRmOzGazahCnfGPbEx+kVALAhdt2FGLLG+7B/8HiCuDzA4CaAQOjx+WkKBkhs/lJqXiRKsMRR4=
X-Received: by 2002:a9f:3fce:: with SMTP id m14mr28243835uaj.96.1553853386713;
 Fri, 29 Mar 2019 02:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <1522856931-6225-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20190327183555.GA23991@vmlxhi-102.adit-jv.com> <CAMuHMdXzspxfSTQSA980VcTusoXTWXDexJuKoOo5gaFGDypc1A@mail.gmail.com>
 <d3746902-bc33-f5f2-660a-4bda583e77d4@de.bosch.com> <a69eb7eb-451c-c32c-4772-798285f0cf9b@de.bosch.com>
 <0f1048cb-ebca-2e66-9b77-70297be96054@de.bosch.com> <1244832967.1529522.1553852778122@webmail.strato.com>
In-Reply-To: <1244832967.1529522.1553852778122@webmail.strato.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Mar 2019 10:56:15 +0100
Message-ID: <CAMuHMdUf6rKxUi14DyJ2kJOGoZA2T+ktTpusBpaJD3rRJ0ZZzg@mail.gmail.com>
Subject: Re: [PATCH v2] serial: sh-sci: Support for HSCIF RX sampling point adjustment
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     Dirk Behme <dirk.behme@de.bosch.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        "George G. Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Joshua Frkuska <joshua_frkuska@mentor.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Magnus Damm <magnus.damm@gmail.com>, Greg KH <greg@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Fri, Mar 29, 2019 at 10:46 AM Ulrich Hecht <uli@fpond.eu> wrote:
> Reviewing the code, I have found another potential issue: the SRR (sampling rate) value is not validated; only values from 7 to 31 are permissible, according to the datasheet. The values in the debug output above would be fine, though.

Isn't that handled by

                .sampling_rate_mask = SCI_SR_RANGE(8, 32),

?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
