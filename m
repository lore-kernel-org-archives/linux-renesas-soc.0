Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:40625 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752083AbdK3NpT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Nov 2017 08:45:19 -0500
Received: by mail-qt0-f196.google.com with SMTP id u42so8721370qte.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Nov 2017 05:45:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171130125217.GE22365@bigcity.dyn.berto.se>
References: <1493717048-10740-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdXbvC90k1QYZsjWx=f7QVQyWOzi_v3u8ShDoDsSAmZsjw@mail.gmail.com>
 <20171130094354.6pktdlcuc3gettji@verge.net.au> <20171130125217.GE22365@bigcity.dyn.berto.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Nov 2017 14:45:17 +0100
Message-ID: <CAMuHMdVKA5YmRPcTTGafKciMF-cKtKTx+PdNJtrDRb20jCxtAA@mail.gmail.com>
Subject: Re: [PATCH/RFT renesas-devel] arm64: dts: ulcb: Enable NFS root
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Thu, Nov 30, 2017 at 1:52 PM, Niklas S=C3=B6derlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2017-11-30 10:43:55 +0100, Simon Horman wrote:
>> On Tue, May 02, 2017 at 11:27:58AM +0200, Geert Uytterhoeven wrote:
>> > On Tue, May 2, 2017 at 11:24 AM, Simon Horman
>> > <horms+renesas@verge.net.au> wrote:
>> > > Enable NFS root on the r8a7795/h3ulcb and r8a7796/m3ulcb
>> > > as per:
>> > > * commit b2407c566ba29215 ("arm64: dts: r8a7795: enable nfs root on =
Salvator-X board").
>> > > * commit 742a9dfb90f0 ("arm64: dts: r8a7796: salvator-x: Enable NFS =
root")
>> > >
>> > > Also set ignore_loglevel rw as boot args as is the case for the boar=
ds
>> > > for the boards for other Renesas ARM/ARM64 based SoCs.
>> >
>> > s/for the boards//
>> >
>> > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>> >
>> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> >
>> > Gr{oetje,eeting}s,
>>
>> Sergei has pointed out that bootargs has seems to have effect on ARM64
>> kernels. So I think this patch should be withdrawn and we should conside=
r
>> removing bootargs from those ARM64 boards where it is present.
>>
>
> I don't think this is true.
>
> I just added a argument to bootargs to salvator-common.dtsi for some
> hack testing and it took effect. Tested on-top of latest renesas-drivers
> and H3 ES2.0.
>
>>>> DIFF <<<
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm6=
4/boot/dts/renesas/salvator-common.dtsi
> index 7b30044a55367d35..4cb4b44f8be42cb4 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -42,7 +42,7 @@
>         };
>
>         chosen {
> -               bootargs =3D "ignore_loglevel rw root=3D/dev/nfs ip=3Ddhc=
p";
> +               bootargs =3D "ignore_loglevel rw root=3D/dev/nfs ip=3Ddhc=
p adv748x.txbvc=3D1";
>                 stdout-path =3D "serial0:115200n8";
>         };
>>>> END DIFF <<<
>
> # cat /sys/firmware/devicetree/base/chosen/bootargs
> ignore_loglevel rw root=3D/dev/nfs ip=3Ddhcp adv748x.txbvc=3D1
>
> And the module parameter had the expected effect on the adv7482x driver.
> Is there another issue here which I'm missing?

1. It may depend on the U-Boot version
2. Anyone playing with CONFIG_CMDLINE and CONFIG_CMDLINE_FORCE?

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
