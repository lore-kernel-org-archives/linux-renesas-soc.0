Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170322142312.GB7266@8bytes.org>
References: <148929710090.20744.10912918031085568693.sendpatchset@little-apple>
 <20170322142312.GB7266@8bytes.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Mar 2017 15:33:13 +0100
Message-ID: <CAMuHMdVXL6CG1Wxxqua1vnKp5wLmYzD+rYAc107KzCA5vWamFQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] iommu/ipmmu-vmsa: r8a7796 support V3
To: Joerg Roedel <joro@8bytes.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        iommu@lists.linux-foundation.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi J=C3=B6rg,

On Wed, Mar 22, 2017 at 3:23 PM, Joerg Roedel <joro@8bytes.org> wrote:
> On Sun, Mar 12, 2017 at 02:38:20PM +0900, Magnus Damm wrote:
>> iommu/ipmmu-vmsa: r8a7796 support V3
>>
>> [PATCH v3 1/3] iommu/ipmmu-vmsa: Add r8a7796 DT binding
>> [PATCH v3 2/3] iommu/ipmmu-vmsa: Increase maximum micro-TLBS to 48
>> [PATCH v3 3/3] iommu/ipmmu-vmsa: Hook up r8a7796 DT matching code
>
> I just tried to apply a few of your patch-sets, but failed because they
> don't apply cleanly and it is not clear what the dependencies are and in
> which order they need to be applied.
>
> So for now I skipped all ipmmu-vmsa patches that are currently in my
> inbox. Please rebase your different series to v4.11-rc3 and resend them
> in the right order, with all Reviewed-bys and other tags that people
> gave you included. Then I am taking another look into applying them.

For the record, they apply cleanly on v4.11-rc1, cfr.
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/l=
og/?h=3Dtopic/r8a7796-ipmmu-v3

As I had no conflicts when creating
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/t=
ag/?h=3Drenesas-drivers-2017-03-21-v4.11-rc3
I expect them to apply cleanly to your next branch, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
