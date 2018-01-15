Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:33310 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753993AbeAOIGA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 03:06:00 -0500
MIME-Version: 1.0
In-Reply-To: <2213619.LpHAiGQTjv@avalon>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
 <1560461.HFdK8RZ078@avalon> <20180115065528.cfelrll6dm6ggf4e@verge.net.au> <2213619.LpHAiGQTjv@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jan 2018 09:05:59 +0100
Message-ID: <CAMuHMdViUyCEW0PwF-ZK_zyMUatRwqJttJiC8n2JYzgvePMgtA@mail.gmail.com>
Subject: Re: [PATCH 01/10] dt-bindings: display: renesas: Add R-Car LVDS
 encoder DT bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Jan 15, 2018 at 7:59 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Monday, 15 January 2018 08:55:29 EET Simon Horman wrote:
>> On Fri, Jan 12, 2018 at 03:29:48PM +0200, Laurent Pinchart wrote:
>> > On Friday, 12 January 2018 12:13:18 EET Geert Uytterhoeven wrote:
>> >> As this is a new binding, please use "renesas,<soc>-lvds".
>> >
>> > I've recently been thinking that we made the wrong choice, <ip>-<soc>
>> > would be better in my opinion as it aligns with <ip>-<version>, but it's
>> > too late to change that, so I'll change the order here.
>>
>> My recollection is that in the beginning we had a bit of a mixture but
>> leaned towards <ip>-<soc>, which made sense in my opinion. However, after
>> some discussion it was agreed that the best-practice for upstream was to
>> use <soc>-<ip>. Unless that situation has changed lets stock with using
>> <soc>-<ip> for new bindings.
>
> Sure, that was my plan, and it seems I failed to explain it clearly. I too
> believe that <ip>-<soc> would be better, but as we have standardized on <soc>-
> <ip> and as there's no strong reason to reconsider that decision at the
> moment, the next version of this patch will use <soc>-<ip>. It was a mistake
> in v1, not an attempt to change what we had agreed on.

Note that I believe you have to consider the full tuple "<vendor>,<soc>-<ip>"
to see the light: <soc> is more closely tied to <vendor>, than <ip> is.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
