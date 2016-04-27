Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www1246.sakura.ne.jp ([219.94.162.56]:60276 "EHLO
	www1246.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752266AbcD0FXn (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 01:23:43 -0400
Message-ID: <57204CDA.6030403@jinso.co.jp>
Date: Wed, 27 Apr 2016 14:23:38 +0900
From: Cao Minh Hiep <cm-hiep@jinso.co.jp>
MIME-Version: 1.0
To: Linus Walleij <linus.walleij@linaro.org>
CC: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sakato Ryusuke <ryusuke.sakato.bx@renesas.com>,
	kuninori morimoto <kuninori.morimoto.gx@renesas.com>,
	Nguyen Viet Dung <nv-dung@jinso.co.jp>,
	LE MINH DUC <lm-duc@jinso.co.jp>,
	=?UTF-8?B?56iy5ZCJ77ya5Lq644K9?= <h-inayoshi@jinso.co.jp>,
	"M.Miura" <m-miura@jinso.co.jp>
Subject: Re: [Bug]:LAGER: GPIO-KEYS: Warning occurs after unbinding the e6051000.gpio
References: <56FE29DC.4060605@jinso.co.jp>	<571DE43D.3020308@jinso.co.jp> <CACRpkdYMD-XZ3w9n=EaSK12xXhiTvStS61a86RYezew_-HYUvA@mail.gmail.com>
In-Reply-To: <CACRpkdYMD-XZ3w9n=EaSK12xXhiTvStS61a86RYezew_-HYUvA@mail.gmail.com>
Content-Type: multipart/mixed;
 boundary="------------070807090401060005050008"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------070807090401060005050008
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Linus-san
Thanks for your reply!

On 04/26/2016 06:20 PM, Linus Walleij wrote:
> On Mon, Apr 25, 2016 at 11:32 AM, Cao Minh Hiep <cm-hiep@jinso.co.jp> wrote:
>
>> Hello Linus Walleij-san
>>
>> We have tested Linux upstream v4.6-rc2 on Renesas's Lager board.
>> When we tried to unbind the e6051000.gpio, the following warning messages
>> occurs:
>>
>> "root@linaro-nano:/sys/bus/platform/drivers/gpio_rcar# echo e6051000.gpio >
>> unbind
>> [  241.511034] ------------[ cut here ]------------
>> [  241.525054] WARNING: CPU: 0 PID: 2104 at fs/proc/generic.c:575
>> remove_proc_entry+0x13c/0x160
>> [  241.550456] remove_proc_entry: removing non-empty directory 'irq/169',
>> leaking at least '6-0039'
> Do you mean that you set up a handler in userspace, using the
> deprecated sysfs ABI and then unbind the module providing the
> IRQ resource?
>
Please see the attach file for procedure test of this case.
In order to make sure that driver works normally after unbind and rebind 
the device.

>> And we found a patch between v4.5 and v4.6-rc2 that causing of this issue.
>> The patch is "ff2b1359 gpio: make the gpiochip a real device"
> It seems the issue is not a bug in the kernel, the issue is that the
> kernel is warning you about something that was wrong also before
> but you didn't get a warning for it until now.
>
> It is not OK to unbind a driver providing IRQs.
>
> It is even unclear if we should even allow modules to provide
> IRQs because there is no way to handle irqchips going away
> when it has consumers.
>
> Maybe we should just do this?
>
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index 3fe8e773d95c..ae5e81358ec5 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -562,6 +562,7 @@ static struct platform_driver gpio_rcar_device_driver = {
>          .driver         = {
>                  .name   = "gpio_rcar",
>                  .of_match_table = of_match_ptr(gpio_rcar_of_table),
> +               .suppress_bind_attrs = true,
>          }
>   };
>
I have just tried to patch this patch on v4.6-rc2, then make a test.
The results is: I could not unbind the device.

"Welcome to Linaro 14.04 (GNU/Linux 4.6.0-rc2-dirty armv7l)

  * Documentation:  https://wiki.linaro.org/
root@linaro-nano:~# uname -a
Linux linaro-nano 4.6.0-rc2-dirty #8 SMP Wed Apr 27 13:40:12 JST 2016 
armv7l armv7l armv7l GNU/Linux
root@linaro-nano:~# cd /sys/bus/platform/drivers/gpio-keys; ls -d keyboard
keyboard
root@linaro-nano:/sys/bus/platform/drivers/gpio-keys# echo keyboard > unbind
root@linaro-nano:/sys/bus/platform/drivers/gpio-keys# cd
root@linaro-nano:~#
root@linaro-nano:~# cd /sys/bus/platform/drivers/gpio_rcar; ls -d 
e6051000.gpio
e6051000.gpio
root@linaro-nano:/sys/bus/platform/drivers/gpio_rcar# echo e6051000.gpio 
 > unbind
-bash: unbind: Permission denied

root@linaro-nano:/sys/bus/platform/drivers/gpio_rcar# ls
e6050000.gpio  e6052000.gpio  e6054000.gpio  uevent
e6051000.gpio  e6053000.gpio  e6055000.gpio
root@linaro-nano:/sys/bus/platform/drivers/gpio_rcar#
"

before patching the patch, gpio-rcar devices are shown as below:

"root@linaro-nano:~# cd /sys/bus/platform/drivers/gpio_rcar; ls
bind           e6051000.gpio  e6053000.gpio  e6055000.gpio  unbind
e6050000.gpio  e6052000.gpio  e6054000.gpio  uevent
root@linaro-nano:/sys/bus/platform/drivers/gpio_rcar# "


Best Regards,
Jinso/Cao Minh Hiep.


--------------070807090401060005050008
Content-Type: text/plain; charset=UTF-8;
 name="gpio-rcar-unbind-rebind-procedure.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="gpio-rcar-unbind-rebind-procedure.txt"

MS5Cb290aW5nIGtlcm5lbC4KCjIuQ29uZmlybSB0aGUgZ3BpbyBrZXlzIGRldmljZS4KIyBj
ZCAvc3lzL2J1cy9wbGF0Zm9ybS9kcml2ZXJzL2dwaW8ta2V5czsgbHMgLWQga2V5Ym9hcmQK
a2V5Ym9hcmQKCjMuRG8gdW5iaW5kIHRoZSBkZXZpY2UKIyBjZCAvc3lzL2J1cy9wbGF0Zm9y
bS9kcml2ZXJzL2dwaW8ta2V5czsgZWNobyBrZXlib2FyZCA+IHVuYmluZAoKNC4gQ29uZmly
bSB0aGUgZ3BpbyByY2FycyBkZXZpY2UKIyBjZCAvc3lzL2J1cy9wbGF0Zm9ybS9kcml2ZXJz
L2dwaW9fcmNhcjsgbHMgLWQgZTYwNTEwMDAuZ3BpbwplNjA1MTAwMC5ncGlvCgo1LkRvIHVu
YmluZCB0aGUgZGV2aWNlLgojIGNkIC9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvZ3Bpb19y
Y2FyOyBlY2hvIGU2MDUxMDAwLmdwaW8gPiB1bmJpbmQKCjYuQ29uZmlybSB0aGUgZ3BpbyBy
Y2FycyBkZXZpY2UKIyBjZCAvc3lzL2J1cy9wbGF0Zm9ybS9kcml2ZXJzL2dwaW9fcmNhcjsg
bHMgLWQgZTYwNTEwMDAuZ3BpbwpsczogY2Fubm90IGFjY2VzcyBlNjA1MTAwMC5ncGlvOiBO
byBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cgo3LiBEbyByZWJpbmQgdGhlIGdwaW8gcmNhciBk
ZXZpY2UuCmNkIC9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvZ3Bpb19yY2FyOyBlY2hvIGU2
MDUxMDAwLmdwaW8gPiBiaW5kCgo4LiBEbyByZWJpbmQgdGhlIGdwaW8ga2V5cyBkZXZpY2Uu
CiMgY2QgL3N5cy9idXMvcGxhdGZvcm0vZHJpdmVycy9ncGlvLWtleXM7ICBlY2hvIGtleWJv
YXJkID4gYmluZAoKOS4gQ29uZmlybS4KCg==
--------------070807090401060005050008--
