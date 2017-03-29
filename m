Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:34813 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754020AbdC2H3i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2017 03:29:38 -0400
Received: by mail-it0-f66.google.com with SMTP id e75so8287360itd.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Mar 2017 00:29:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87vaqsajo0.wl%kuninori.morimoto.gx@renesas.com>
References: <87vaqsajo0.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Mar 2017 09:29:26 +0200
Message-ID: <CAMuHMdVL-UWPUo_nLthEjJNoO=QujRijW6w9g=8YD7FsmPXO6g@mail.gmail.com>
Subject: Re: [RFC][PATCH] ASoC: soc-core: verify Sound Card normality
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Lars-Peter <lars@metafoo.de>,
        Simon <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Wed, Mar 29, 2017 at 4:45 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Current ALSA SoC Sound Card basically consists of CPU/Codec/Platform
> drivers. If system uses Kernel modules, we can disable these drivers
> by using rmmod command. In such case, we can't disable
> CPU/Codec/Platform driver without disabling Sound Card driver.
>
> But on the other hand, we can disable these drivers by using unbind
> command. In such case, we can disable these drivers randomly.
> In this case, we can create dirty Sound Card which is missing necessary
> components.
>
> (1) If user disabled Sound Card first, but did nothing to other drivers,
> user can't use Sound because Sound Card is no longer exists.
> (2) If user disabled CPU/Codec/Platform driver randomly, but did nothing
> to Sound Card, user still be able to use Sound Card, because dirty Sound
> Card which is missing necessary components still exists.
> In this case, Sound system will be crashed if user started sound
> playback/capture. But we can't block such random unbind now.
>
> To avoid Sound Card crash in (2) case, what we can do now is, add dirty
> flag on Sound Card, and avoid to open Sound Card.
> This patch solved this issue.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c

> @@ -3236,6 +3244,8 @@ static void snd_soc_component_cleanup(struct snd_soc_component *component)
>
>  static void snd_soc_component_del_unlocked(struct snd_soc_component *component)
>  {
> +       if (component->card)
> +               component->card->dirty = 1;

Currently this is the only assignment to .dirty.
Can this be undone later, when the driver is bound again?

>         list_del(&component->list);
>  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
