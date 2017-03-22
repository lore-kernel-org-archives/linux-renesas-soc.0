Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35428 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934354AbdCVLay (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Mar 2017 07:30:54 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ON701PJZRZGQO60@mailout3.samsung.com> for
 linux-renesas-soc@vger.kernel.org; Wed, 22 Mar 2017 20:30:52 +0900 (KST)
Subject: Re: [PATCH][RFC] ASoC: core: remove pointless auxiliary from
 snd_soc_component
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
        Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <a70b7fc4-1328-0ca2-1182-0a92863d90da@samsung.com>
Date: Wed, 22 Mar 2017 12:30:47 +0100
MIME-version: 1.0
In-reply-to: <87o9xcp6zi.wl%kuninori.morimoto.gx@renesas.com>
Content-type: text/plain; charset=windows-1252; format=flowed
Content-transfer-encoding: 7bit
References: <CGME20170308072638epcas1p4b3a0c943539f55ec83eb66a3b0fec621@epcas1p4.samsung.com>
 <87o9xcp6zi.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/08/2017 08:26 AM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> commit 1a653aa44725 ("ASoC: core: replace aux_comp_list to ...")
> tried to replace aux_comp_list to component_dev_list,
> but it failed because of binding timing. Thus, Sylwester fixuped it by
> commit d2e3a1358c37 ("ASoC: Fix binding and probing of auxiliary...").
>
> One of main purpose of commit 1a653aa44725 ("ASoC: core: replace...")
> was remove replaceable list (= list_aux) from snd_soc_component by using
> new "auxiliary" flags (but it failed).
> Because of this background, current code has reborned card_aux_list
> (= same as original list_aux), and almost pointless "auxiliary" flags.
>
> Let's remove pointless "auxiliary" flags by this patch
> This means, it is same as revert both
> commit 1a653aa44725 ("ASoC: core: replace aux_comp_list to ...") and
> commit d2e3a1358c37 ("ASoC: Fix binding and probing of auxiliary...").
>
> Not-yet-Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> request-Tested-by-from: Sylwester Nawrocki <s.nawrocki@samsung.com>

I tested in on top of v4.11-rc3 on the TM2 board and didn't notice any issues,
the sound card got initialized properly.

Tested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
