Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f195.google.com ([209.85.210.195]:36552 "EHLO
        mail-wj0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932231AbcK1JRU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Nov 2016 04:17:20 -0500
Received: by mail-wj0-f195.google.com with SMTP id jb2so13174603wjb.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Nov 2016 01:17:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87polgwja2.wl%kuninori.morimoto.gx@renesas.com>
References: <1479830313-24241-1-git-send-email-geert+renesas@glider.be>
 <HK2PR06MB05481690E2ECEFC707F38811D8890@HK2PR06MB0548.apcprd06.prod.outlook.com>
 <CAMuHMdXpR++d4gM8DH7pwie+-Ksn_PizRE_QwGtavHmL=9G_2g@mail.gmail.com>
 <HK2PR06MB05483B0291C06875A7264ADCD8890@HK2PR06MB0548.apcprd06.prod.outlook.com>
 <87polgwja2.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Nov 2016 10:17:18 +0100
Message-ID: <CAMuHMdV6G_B+2e05_n3dLMPvKfURJFJjENmzHSf0FUD2wTSy2A@mail.gmail.com>
Subject: Re: renesas-drivers-2016-11-22-v4.9-rc6
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Mon, Nov 28, 2016 at 1:17 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>> I did just "git fetch" on my local renesas-drivers.git repo.
>> The local repo has other tags (e.g. renesas-drivers-2016-11-22-v4.9-rc6).
>> And renesas-drivers-next-2016-11-22-v4.9-rc6 didn't exist.
>> But, I tried "git fetch" now, and I could get the "next" tag ;)
>> I don't know why, but thank you for your support!
>
> Hmm... what's wrong?
> Is "git remote update" not enough ??
> and tag is strange ??

I've found what's wrong: while my repo has the
renesas-drivers-next-2016-11-22-v4.9-rc6 tag, and all objects pointed to by
it, it does not have a branch matching the tag.

When doing "git remote update", git updates all branches first, followed by
importing all tags.  Apparently git skips tags pointing to objects that do
not exist locally.  If I import those objects in some other way first, "git
remote update" does import the tag.

I've fixed this by pushing a branch called renesas-drivers-next, matching
the tag. Can you please give it a try? According to my local testing, it
should work:

  * [new branch]                        master     -> renesas-drivers/master
  * [new branch]                        rcar-rst   -> renesas-drivers/rcar-rst
  * [new branch]
renesas-devel-20161117v2-v4.9-rc5+rcar-rst ->
renesas-drivers/renesas-devel-20161117v2-v4.9-rc5+rcar-rst
+ * [new branch]                        renesas-drivers-next ->
renesas-drivers/renesas-drivers-next
  * [new branch]                        rmobile-genpd ->
renesas-drivers/rmobile-genpd
  * [new branch]                        rzg-clock-defs ->
renesas-drivers/rzg-clock-defs
  * [new branch]                        scif-brg   -> renesas-drivers/scif-brg
@@ -243,6 +244,7 @@ From git://git.kernel.org/pub/scm/linux/
  * [new tag]                           clk-renesas-for-v4.9-tag2 ->
clk-renesas-for-v4.9-tag2
  * [new tag]                           clk-renesas-for-v4.9-tag3 ->
clk-renesas-for-v4.9-tag3
  * [new tag]
renesas-drivers-2016-11-22-v4.9-rc6 ->
renesas-drivers-2016-11-22-v4.9-rc6
+ * [new tag]
renesas-drivers-next-2016-11-22-v4.9-rc6 ->
renesas-drivers-next-2016-11-22-v4.9-rc6
  * [new tag]                           rzg-clock-defs-tag1 ->
rzg-clock-defs-tag1
  * [new tag]                           sh-pfc-for-v4.10-tag2 ->
sh-pfc-for-v4.10-tag2
  * [new tag]                           sh-pfc-for-v4.7-tag1 ->
sh-pfc-for-v4.7-tag1

Sorry for the trouble.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
