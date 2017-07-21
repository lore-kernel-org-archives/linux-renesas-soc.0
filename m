Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48]:34408 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753245AbdGUIEJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jul 2017 04:04:09 -0400
Received: by mail-wm0-f48.google.com with SMTP id l81so1817873wmg.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jul 2017 01:04:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1500365480070.8623@osrenterprises.com>
References: <1500365480070.8623@osrenterprises.com>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 21 Jul 2017 17:04:07 +0900
Message-ID: <CANqRtoS1YGxKP2bFJyBN0LZQpXi7McGPDk1Qs_CSvohaXLQF=Q@mail.gmail.com>
Subject: Re: [R-CAR H3] Can't Modify U-Boot Environment Variables on Updated Firmware
To: Eli Sherman <eli.sherman@osrenterprises.com>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Eli,

Thanks for your email. I just checked this topic and through a back
channel I learned that some support is going on with this matter.

In case you are unable to solve your issue please contact the mailing
list again and keep me on CC. I have physical and remote access to
several R-Car Gen3 boards including h3ulcb in ES1 and ES2 versions.
For Salvator-X I also wrote some scripts to automate update of the
firmware stack from Linux, so I have experience using the SCIF D/L
mode on R-Car Gen3 SoCs.

If you are stuck with the firmware updating process feel free to ping
me and I can point you in the right direction.

Best,

/ magnus

On Tue, Jul 18, 2017 at 5:12 PM, Eli Sherman
<eli.sherman@osrenterprises.com> wrote:
> Hello,
> I understand that this is the mailing list for support for the R-Car line=
 of boards. If this information is incorrect, please direct me, if possible=
, to the correct resource.
> I have posted my issue to various rcar-related repos on github as well as=
 the e-linux talk page. Issue is as follows:
>
> I am trying to get up and running with the R-Car H3 Starter Kit Premier B=
oard (h3ulcb). I first followed the instructions at http://elinux.org/R-Car=
/Boards/Yocto-Gen3 to build Yocto 2.19 for the board. When I attempted to r=
un the built Yocto image on the board (both via tftp and via microSD), I re=
ceived a kernel panic message. The limited resources on the internet (i.e.,=
 the other posts on this wiki) indicated this could likely be resolved by u=
pdating the firmware. I then followed the instructions at http://elinux.org=
/R-Car/Boards/H3SK#Flashing_firmware to update the firmware on the board. N=
ow when I turn the board on, I cannot get to the stage where the option of =
cancelling autoboot (as shown in examples in the links given). I am therefo=
re not able to change U-Boot's environment variables to specify the Image f=
ile to boot. It seems that U-Boot is perhaps not loading at all. Any help w=
ould be greatly appreciated!
> Output of boot sequence is below:
>
>
>
> user@user-linux:~$ sudo picocom -b 115200 --send-cmd "ascii-xfr -vvs" /de=
v/ttyUSB0
> [sudo] password for user:
> picocom v1.7
> port is : /dev/ttyUSB0
> flowcontrol : none
> baudrate is : 115200
> parity is : none
> databits are : 8
> escape is : C-a
> local echo is : no
> noinit is : no
> noreset is : no
> nolock is : no
> send_cmd is : ascii-xfr -vvs
> receive_cmd is : rz -vv
> imap is :
> omap is :
> emap is : crcrlf,delbs,
> Terminal ready
> [ 0.000194] NOTICE: BL2: R-Car Gen3 Initial Program Loader(CA57) Rev.1.0.=
14
> [ 0.005761] NOTICE: BL2: PRR is R-Car H3 Ver2.0
> [ 0.010335] NOTICE: BL2: Board is unknown Rev0.0
> [ 0.015006] NOTICE: BL2: Boot device is HyperFlash(80MHz)
> [ 0.020445] NOTICE: BL2: LCM state is CM
> [ 0.024423] NOTICE: BL2: AVS setting succeeded. DVFS_SetVID=3D0x52
> [ 0.030611] NOTICE: BL2: DDR3200(rev.0.22)NOTICE: [COLD_BOOT]NOTICE: ..0
> [ 0.091270] NOTICE: BL2: DRAM Split is 4ch
> [ 0.095155] NOTICE: BL2: QoS is default setting(rev.0.14)
> [ 0.100655] NOTICE: BL2: Lossy Decomp areas
> [ 0.104832] NOTICE: Entry 0: DCMPAREACRAx:0x80000540 DCMPAREACRBx:0x570
> [ 0.111917] NOTICE: Entry 1: DCMPAREACRAx:0x40000000 DCMPAREACRBx:0x0
> [ 0.118829] NOTICE: Entry 2: DCMPAREACRAx:0x20000000 DCMPAREACRBx:0x0
> [ 0.125743] NOTICE: BL2: v1.3(release):4eef9a2
> [ 0.130233] NOTICE: BL2: Built : 17:35:56, Jul 13 2017
> [ 0.135420] NOTICE: BL2: Normal boot
> [ 0.139062] NOTICE: BL2: dst=3D0xe6320190 src=3D0x8180000 len=3D512(0x200=
)
> [ 0.145608] NOTICE: BL2: dst=3D0x43f00000 src=3D0x8180400 len=3D6144(0x18=
00)
> [ 0.152070] NOTICE: BL2: dst=3D0x44000000 src=3D0x81c0000 len=3D65536(0x1=
0000)
> [ 0.159295] NOTICE: BL2: dst=3D0x44100000 src=3D0x8200000 len=3D524288(0x=
80000)
> [ 0.169775] NOTICE: BL2: dst=3D0x50000000 src=3D0x8640000 len=3D1048576(0=
x100000)
>
> Thank you in advance for your help.
>
