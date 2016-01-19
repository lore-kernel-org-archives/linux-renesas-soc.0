MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1453205888-8985-5-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1453205888-8985-1-git-send-email-ulrich.hecht+renesas@gmail.com>
	<1453205888-8985-5-git-send-email-ulrich.hecht+renesas@gmail.com>
Date: Tue, 19 Jan 2016 16:42:59 +0100
Message-ID: <CAMuHMdXuPxmzi0O-DTV3XDQkrXG=Fc8ZANdNAvLbNzAXRrjtjg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: r8a7795: Add PWM device nodes
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, ryo.kodama.vz@renesas.com,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>, harunobu.kurokawa.dn@renesas.com,
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 19, 2016 at 1:18 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> From: Ryo Kodama <ryo.kodama.vz@renesas.com>
>
> Signed-off-by: Ryo Kodama <ryo.kodama.vz@renesas.com>
> Signed-off-by: Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>
> [uli: adapted to new MSTP clock scheme]
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  .../devicetree/bindings/pwm/renesas,pwm-rcar.txt   |  1 +
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 21 ++++++++++
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi           | 48 ++++++++++++++++++++++
>  3 files changed, 70 insertions(+)

This should be split in 3 patches:
  - One to update the binding docs,
  - One to add the PWM device nodes to r8a7795.dtsi,
  - One to enable PWM on Salvator-X.

> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> @@ -93,6 +93,15 @@
>  };
>
>  &pfc {
> +       pwm1_pins: pwm1 {
> +               renesas,groups = "pwm1_a", "pwm1_b";
> +               renesas,function = "pwm1";

Enabling both pwm1_a and pwm1_b?
The LTC2644CMS-L8 DAC providing backlight is connected to pwm1_a, depending
on the state of switch SW5.

> +       };
> +       pwm2_pins: pwm2 {
> +               renesas,groups = "pwm2_a", "pwm2_b";
> +               renesas,function = "pwm2";

Enabling both pwm2_a and pwm2_b?
The BD9571MWV-M PMIC is connected to pwm2_a, depending on the state of
switch SW6.

> +       };

> @@ -174,6 +183,18 @@
>         };
>  };
>
> +&pwm1 {
> +       pinctrl-0 = <&pwm1_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
> +&pwm2 {
> +       pinctrl-0 = <&pwm2_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};

It would be good to have a comment explaining what these are actually used for.

> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> index bb353cd..3c88b04 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -446,6 +446,54 @@
>                         status = "disabled";
>                 };
>
> +               pwm1: pwm@e6e31000 {
> +                       compatible = "renesas,pwm-r8a7795", "renesas,pwm-rcar";
> +                       reg = <0 0xe6e31000 0 0x10>;
> +                       #pwm-cells = <2>;
> +                       clocks = <&cpg CPG_MOD 523>;

Missing "power-domains = <&cpg>;", for all nodes.

Note that CPG module clock 523 is not yet provided by
drivers/clk/shmobile/r8a7795-cpg-mssr.c.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
