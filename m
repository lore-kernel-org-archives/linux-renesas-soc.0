Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:41081 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753622AbdLOIiM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 03:38:12 -0500
Received: by mail-qk0-f195.google.com with SMTP id r184so1780954qke.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2017 00:38:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201712150538.Sbcjg0Am%fengguang.wu@intel.com>
References: <201712150538.Sbcjg0Am%fengguang.wu@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Dec 2017 09:38:11 +0100
Message-ID: <CAMuHMdVEt46LuRgqSUA=O7gTddGmTO7WkjtjLXJRivPK=00YQw@mail.gmail.com>
Subject: Re: [renesas-drivers:topic/renesas-overlays 23/92]
 drivers/of/dynamic.c:1141:13: sparse: incorrect type in assignment (different
 base types)
To: kbuild test robot <fengguang.wu@intel.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        kbuild-all@01.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fengguang,

On Thu, Dec 14, 2017 at 10:37 PM, kbuild test robot
<fengguang.wu@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays
> head:   47d433a558bb60587eb9f86a4d010ef74e03fa0d
> commit: e068b1eab7180587d15bbc55abdc5851b7f216dc [23/92] of: changesets: Introduce changeset helper methods
> reproduce:
>         # apt-get install sparse
>         git checkout e068b1eab7180587d15bbc55abdc5851b7f216dc
>         make ARCH=x86_64 allmodconfig
>         make C=1 CF=-D__CHECK_ENDIAN__
>
>
> sparse warnings: (new ones prefixed by >>)
>
>
> vim +1141 drivers/of/dynamic.c
>
>   1124
>   1125  /**
>   1126   * of_changeset_add_property_u32 - Create a new u32 property
>   1127   *
>   1128   * @ocs:        changeset pointer
>   1129   * @np:         device node pointer
>   1130   * @name:       name of the property
>   1131   * @val:        value in host endian format
>   1132   *
>   1133   * Adds a u32 property to the changeset.
>   1134   *
>   1135   * Returns zero on success, a negative error value otherwise.
>   1136   */
>   1137  int of_changeset_add_property_u32(struct of_changeset *ocs,
>   1138                  struct device_node *np, const char *name, u32 val)
>   1139  {
>   1140          /* in place */
>> 1141          val = cpu_to_be32(val);
>   1142          return of_changeset_add_property_copy(ocs, np, name, &val, sizeof(val));
>   1143  }

Thank you, folding

+       __be32 x;
+
        /* in place */
-       val = cpu_to_be32(val);
-       return of_changeset_add_property_copy(ocs, np, name, &val, sizeof(val));
+       x = cpu_to_be32(val);
+       return of_changeset_add_property_copy(ocs, np, name, &x, sizeof(x));

into the offending commit.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
