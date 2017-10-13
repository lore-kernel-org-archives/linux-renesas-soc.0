Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:48482 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753135AbdJMJA5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2017 05:00:57 -0400
Received: by mail-lf0-f49.google.com with SMTP id a69so8806447lfe.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Oct 2017 02:00:57 -0700 (PDT)
Subject: Re: [PATCH 2/2] arm64: renesas: ulcb: fixup audio_clkout
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon <horms@verge.net.au>
Cc: Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
References: <87mv4vvbsh.wl%kuninori.morimoto.gx@renesas.com>
 <87infjvbqb.wl%kuninori.morimoto.gx@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1c61c924-6dbd-0742-1b1a-7a4e9faa208e@cogentembedded.com>
Date: Fri, 13 Oct 2017 12:00:56 +0300
MIME-Version: 1.0
In-Reply-To: <87infjvbqb.wl%kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/13/2017 8:57 AM, Kuninori Morimoto wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> "audio_clkout" is dummy clock of <&rcar_sound 0> to avoid clock loop
> which invites probe conflct. Thus <&rcar_sound 0> and "audio_clkout"
> should be same value.
> 
> On commit 2752660a37ae ("arm64: dts: renesas: ulcb: sound
> clock-frequency needs descending order") exchanged <&rcar_sound 0>,
> but it didn't modify "audio_clkout".
> This patch fixup it.
> 
> Fixes: 2752660a37ae ("arm64: dts: renesas: ulcb: sound
>                        clock-frequency needs descending order")
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
[...]

    Same comments as for the previous patch...

MBR, Sergei
