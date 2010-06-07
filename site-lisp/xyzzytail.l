; -*- Mode: Lisp; Package: editor -*-

#|
= xyzzytail - �R�}���h���C������w�肵���t�@�C���� tail-f ����

* Author:  MIYAMUKO Katsuyuki ((<URL:mailto:miyamuko@gmail.com>))
* URL: ((<URL:http://miyamuko.s56.xrea.com/xyzzy/xyzzytail/intro.htm>))
* Version: $Id: xyzzytail.l,v 1.4 2004/08/09 14:24:52 miyamuko Exp $


== ����

�R�}���h���C���Ŏw�肵���t�@�C���� tail-f ���܂��B

  > xyzzytail logfile ...

send-to �ɓ���Ă����Ə����K���ɂȂ邩���m��܂���B

* -l �� -e �Ȃǂ̒ʏ�� xyzzy �̈����������Ɏw��\�ł��B


== �C���X�g�[��

((<NetInstaller|URL:http://www.mirai.ne.jp/~gyo/xyzzy/ni.html>)) �ŃC���X�g�[�������ꍇ��
4 �ȍ~�� OK �ł��B

(1) �A�[�J�C�u���_�E�����[�h���܂��B

    ((<URL:http://miyamuko.s56.xrea.com/xyzzy/archives/xyzzytail.zip>))

(2) �A�[�J�C�u��W�J���āA$XYZZY/site-lisp �z���Ƀt�@�C�����R�s�[���܂��B

(3) xyzzycli.exe �� xyzzytail.exe �Ƃ������O�ŃR�s�[���܂��B

(4) $XYZZY/site-lisp/siteinit.l �Ɉȉ��̃R�[�h��ǉ����܂��B

        ; xyzzytail
        (require "xyzzytail")

    ���K�� siteinit.l �ɒǉ����Ă��������B.xyzzy ���Ɠ��삵�܂���B

(5) �ݒ�𔽉f������ɂ� xyzzy ���ă_���v���Ă��������B

(6) ((%xyzzytail logfile ...%)) �Ŏw�肳�ꂽ�t�@�C�������ׂ� tail-f ���܂��B


== ���t�@�����X

=== �ϐ�

--- *tail-f-command-line-hook*
    tail-f �̎��s�O�Ɏ��s����t�b�N�ł��B

    tail-f ����t�@�C������������ run-hook-with-args �Ŏ��s���܂��B
    �w�肵���t�@�C���̐��������s����܂��B

    ex)
        (add-hook '*tail-f-command-line-hook* #'(lambda (logfile)
                                                  (msgbox "tail-f: ~A" logfile)))

=== xyzzytail.ini

�ʏ�̐ݒ�ł͊��� xyzzy ���N�����Ă���ꍇ�A���� xyzzy �� tail-f �����s���܂��B
��� xyzzy ��V�K�ɋN���������ꍇ�� xyzzytail.ini �� (({multipleInstances=1})) ��ݒ肵�Ă��������B

    [xyzzy]
    precedingOptions="-f tail-f-command-line-setup"
    followingOptions="-f tail-f-command-line-teardown"
    multipleInstances=1


== ���ꂩ���邩������Ȃ�����

* �Ȃ�?


== ���C�Z���X

xyzzytail �͏C�� BSD ���C�Z���X�Ɋ�Â��ė��p�\�ł��B

  Copyright (C) 2003-2004 MIYAMUKO Katsuyuki. All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are
  met:

  1 Redistributions of source code must retain the above copyright notice,
  this list of conditions and the following disclaimer as the first lines
  of this file unmodified.

  2 Redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer in the
  documentation and/or other materials provided with the distribution.

  THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
  SUCH DAMAGE.
|#

(provide "xyzzytail")
(in-package "editor")

;; -f �Ŏ��s����֐��� user �� export ���Ȃ��Ƃ���
(export '(tail-f-command-line-setup
          tail-f-command-line-teardown
          *tail-f-command-line-hook*))

(defvar *tail-f-command-line-hook* nil)

(defun tail-f-command-line (file)
  (run-hook-with-args '*tail-f-command-line-hook* file)
  (tail-f file))

(defun tail-f-command-line-setup ()
  (add-hook '*process-command-line-hook* 'tail-f-command-line))

(defun tail-f-command-line-teardown ()
  (delete-hook '*process-command-line-hook* 'tail-f-command-line))

;;
;; $Id: xyzzytail.l,v 1.4 2004/08/09 14:24:52 miyamuko Exp $
;;