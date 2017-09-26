Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33927 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966345AbdIZNHR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 09:07:17 -0400
Received: by mail-wm0-f67.google.com with SMTP id i131so9237595wma.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 06:07:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3351146.sONqpoGtve@avalon>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170926100605.2313-12-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXQ8J1cfGMnyAwhkxNQKCvR95gHESzxZswKrwoKMG_U9g@mail.gmail.com> <3351146.sONqpoGtve@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Sep 2017 15:07:15 +0200
Message-ID: <CAMuHMdWD5qb-R7sWphmguxgBKxL99+XeZXhZoCGh+QeOvvUxnA@mail.gmail.com>
Subject: Re: [RFC 09/13] v4l: rcar-fcp: Configure the number of outstanding
 read transactions
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Sep 26, 2017 at 3:01 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tuesday, 26 September 2017 14:50:46 EEST Geert Uytterhoeven wrote:
>> On Tue, Sep 26, 2017 at 12:06 PM, Laurent Pinchart wrote:
>> >  static const struct of_device_id rcar_fcp_of_match[] = {
>> >         { .compatible = "renesas,fcpf", .data = (void *)RCAR_FCPF },
>> >         { .compatible = "renesas,fcpv", .data = (void *)RCAR_FCPV },
>> > +       { .compatible = "renesas,fcpvi", .data = (void *)RCAR_FCPVI },
>> >         { },
>>
>> As you use "renesas,fcpv" as a fallback value, you may want to insert
>> the new and more specific "renesas,fvpci" handling above it, for clarity.
>
> Good point, I'll do that.
>
>> I believe it will return the RCAR_FCPVI match data anyway, based on
>> a higher match score for the more specific compatible value?
>
> I don't think this is related to a match score, but to the fact the compatible
> strings from DT are tried in the left to right direction.

JTR, see the use scores in __of_match_node() and __of_device_is_compatible().

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
