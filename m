Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:51371 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756573AbdJMJAA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2017 05:00:00 -0400
Received: by mail-lf0-f53.google.com with SMTP id r129so8813054lff.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Oct 2017 01:59:59 -0700 (PDT)
Subject: Re: [PATCH 1/2] arm64: renesas: salvator-common: fixup audio_clkout
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon <horms@verge.net.au>
Cc: Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
References: <87mv4vvbsh.wl%kuninori.morimoto.gx@renesas.com>
 <87k1zzvbqw.wl%kuninori.morimoto.gx@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <23722c6e-63d0-7c52-f956-2e2ec9390fb2@cogentembedded.com>
Date: Fri, 13 Oct 2017 11:59:58 +0300
MIME-Version: 1.0
In-Reply-To: <87k1zzvbqw.wl%kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 10/13/2017 8:56 AM, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> "audio_clkout" is dummy clock of <&rcar_sound 0> to avoid clock loop
> which invites probe conflct. Thus <&rcar_sound 0> and "audio_clkout"

    Conflict.

> should be same value.
> 
> On commit 5e2feac33095 ("arm64: renesas: salvator-common: sound
> clock-frequency needs descending order") exchanged <&rcar_sound 0>,
> but it didn't modify "audio_clkout".
> This patch fixup it.

    Fixes it up.

> Fixes: 5e2feac33095 ("arm64: renesas: salvator-common: sound
>                        clock-frequency needs descending order")

    Don't ever wrap the summaries around in this tag.

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
[...]

MBR, Sergei
